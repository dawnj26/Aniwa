import 'dart:convert';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../models/anime.dart';
import '../models/anime_details.dart';

const listCategory = [
  'Watching',
  'Plan to watch',
  'Finished',
];

Anime a = Anime.empty();

DateTime formatDateToDateTime(String inputDate) {
  // Parse the input date string (in the format 'yyyy-MM-dd')
  DateTime parsedDate = DateFormat('yyyy-MM-dd').parseStrict(inputDate);

  // Create a new DateTime object with the formatted date ('MM/dd/yyyy')
  DateTime formattedDateTime =
      DateTime(parsedDate.year, parsedDate.month, parsedDate.day);

  return formattedDateTime;
}

String formatDateToString(DateTime dateTime) {
  // Format the DateTime object to 'yyyy-MM-dd'
  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

  return formattedDate;
}

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(this.anime, this.updateAnime, this.deleteAnime,
      {super.key});

  final Anime anime;
  final void Function(Anime a) updateAnime;
  final void Function(int id, BuildContext context) deleteAnime;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    a = Anime.copyWith(widget.anime);
  }

  @override
  void dispose() {
    a = Anime.empty();
    super.dispose();
  }

  Future<AnimeDetails> fetchAnime(int id) async {
    String query = r'''
    query($id: Int) {
      Media(id: $id, type: ANIME) {
        description
        genres
      }
    }
    ''';

    Map<String, dynamic> variables = {
      'id': id,
    };

    var url = Uri.parse(r'https://graphql.anilist.co');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'query': query,
          'variables': variables,
        }));

    if (response.statusCode == 200) {
      return AnimeDetails.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load anime');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (a.category == 'Plan to watch' && a.currentEpisode > 0) {
                a.category = 'Watching';
                a.startDate = formatDateToString(DateTime.now());
              } else if ((a.category == 'Watching' ||
                      a.category == 'Plan to watch') &&
                  widget.anime.category != a.category) {
                a.currentEpisode = 0;
              } else if (a.category == 'Finished') {
                a.currentEpisode = a.totalEpisodes;
                a.endDate = formatDateToString(DateTime.now());
              } else if (a.currentEpisode == a.totalEpisodes) {
                a.endDate = formatDateToString(DateTime.now());
                a.category = 'Finished';
              } else if ((a.category == 'Watching' ||
                      a.category == 'Plan to watch') &&
                  a.currentEpisode == a.totalEpisodes) {
                a.currentEpisode = 0;
              }

              widget.updateAnime(a);
              const snackBar = SnackBar(
                content: Text('Saved successfully'),
              );

              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a SnackBar.
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              widget.deleteAnime(widget.anime.id, context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            AnimeHeader(widget.anime),
            const Gap(8.0),
            FutureBuilder<AnimeDetails>(
              future: fetchAnime(widget.anime.id),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var animeThis = snapshot.data;
                if (animeThis == null) {
                  return const Center(
                    child: Text("No anime"),
                  );
                }
                return Wrap(
                  spacing: 4.0,
                  children: animeThis.data!.media!.genres!.map((e) {
                    return GenreBadge(e);
                  }).toList(),
                );
              },
            ),
            const Gap(8.0),
            AboutAnime(
              fetchAnime(widget.anime.id),
              id: widget.anime.id,
            ),
            const Gap(16.0),
            Form(
              child: Column(
                children: [
                  DropdownMenu<String>(
                    width: 350.0,
                    label: const Text('Category'),
                    initialSelection: listCategory
                        .where((element) => element == widget.anime.category)
                        .first,
                    onSelected: (s) {
                      a.category = s!;
                    },
                    dropdownMenuEntries: listCategory
                        .map((s) => DropdownMenuEntry(value: s, label: s))
                        .toList(),
                  ),
                  const Gap(8.0),
                  EpisodeCounter(
                      widget.anime.totalEpisodes, widget.anime.currentEpisode),
                  const Gap(8.0),
                  StartDate(formatDateToDateTime(widget.anime.startDate!)),
                  const Gap(16.0),
                  EndDate(formatDateToDateTime(widget.anime.endDate!)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StartDate extends StatefulWidget {
  const StartDate(
    this.startDate, {
    super.key,
  });

  final DateTime startDate;

  @override
  State<StartDate> createState() => _StartDateState();
}

class _StartDateState extends State<StartDate> {
  DateTime? date = formatDateToDateTime(a.startDate!);

  void selectDate() async {
    date = await showDatePicker(
      context: context,
      initialDate: date!,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 100),
    );

    if (date == null) {
      date = formatDateToDateTime(a.startDate!);
      return;
    }

    a.startDate = formatDateToString(date!);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InputDatePickerFormField(
            firstDate: DateTime(DateTime.now().year - 100),
            lastDate: DateTime(DateTime.now().year + 100),
            initialDate: date,
            fieldLabelText: 'Start date',
          ),
        ),
        IconButton(
            onPressed: selectDate, icon: const Icon(Icons.calendar_month)),
      ],
    );
  }
}

class EndDate extends StatefulWidget {
  const EndDate(
    this.endDate, {
    super.key,
  });

  final DateTime endDate;

  @override
  State<EndDate> createState() => _EndDateState();
}

class _EndDateState extends State<EndDate> {
  DateTime? date = formatDateToDateTime(a.endDate!);

  void selectDate() async {
    date = await showDatePicker(
      context: context,
      initialDate: date!,
      firstDate: DateTime.now().subtract(const Duration(days: 0)),
      lastDate: DateTime(DateTime.now().year + 100),
    );

    if (date == null) {
      date = formatDateToDateTime(a.endDate!);
      return;
    }
    a.endDate = formatDateToString(date!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InputDatePickerFormField(
            firstDate: DateTime(DateTime.now().year),
            lastDate: DateTime(DateTime.now().year + 100),
            initialDate: date,
            fieldLabelText: 'End date',
          ),
        ),
        IconButton(
            onPressed: selectDate, icon: const Icon(Icons.calendar_month)),
      ],
    );
  }
}

class EpisodeCounter extends StatefulWidget {
  const EpisodeCounter(
    this.totalEps,
    this.currentEps, {
    super.key,
  });

  final int totalEps;
  final int currentEps;

  @override
  State<EpisodeCounter> createState() => _EpisodeCounterState();
}

class _EpisodeCounterState extends State<EpisodeCounter> {
  var ctrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ctrl.text = a.currentEpisode.toString();
  }

  void checkMax() {
    if (int.parse(ctrl.text) > widget.totalEps) {
      ctrl.text = widget.totalEps.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: ctrl,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Episodes'),
            ),
            keyboardType: const TextInputType.numberWithOptions(
              decimal: false,
              signed: false,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onEditingComplete: checkMax,
          ),
        ),
        Column(
          children: [
            IconButton(
                onPressed: () {
                  if (int.parse(ctrl.text) == widget.totalEps) {
                    return;
                  }
                  setState(() {
                    ctrl.text = (int.parse(ctrl.text) + 1).toString();
                    a.currentEpisode = int.parse(ctrl.text);
                  });
                },
                icon: const Icon(Icons.arrow_drop_up)),
            IconButton(
                onPressed: () {
                  if (int.parse(ctrl.text) == 0) {
                    return;
                  }
                  setState(() {
                    ctrl.text = (int.parse(ctrl.text) - 1).toString();
                    a.currentEpisode = int.parse(ctrl.text);
                  });
                },
                icon: const Icon(Icons.arrow_drop_down)),
          ],
        )
      ],
    );
  }
}

class AnimeHeader extends StatelessWidget {
  const AnimeHeader(
    this.anime, {
    super.key,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          child: AspectRatio(
            aspectRatio: 0.7,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                anime.coverImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Gap(8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 220.0,
              child: Text(
                anime.title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
                softWrap: true,
              ),
            ),
            const Gap(4.0),
            Row(
              children: [
                const Icon(Icons.tv),
                const Gap(4.0),
                Text('${anime.category} | ${anime.totalEpisodes} episodes'),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class AboutAnime extends StatelessWidget {
  const AboutAnime(
    this.animeDetails, {
    super.key,
    required this.id,
  });

  final int id;
  final Future<AnimeDetails> animeDetails;

  String filterDescription(String text) {
    return text.replaceAll(RegExp(r'\n|<[^>]*>|\\'), '');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AnimeDetails>(
      future: animeDetails,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        var animeThis = snapshot.data;
        if (animeThis == null) {
          return const Center(
            child: Text("No anime"),
          );
        }
        return ExpandablePanel(
          header: Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'About this anime',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          collapsed: Text(
            filterDescription(animeThis.data!.media!.description!),
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          expanded: Text(
            filterDescription(animeThis.data!.media!.description!),
            softWrap: true,
          ),
        );
      },
    );
    // return ExpandablePanel(
    //   header: Container(
  }
}

class GenreBadge extends StatelessWidget {
  const GenreBadge(
    this.genre, {
    super.key,
  });

  final String genre;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: const Color(0xff322f35),
      label: Text(
        genre,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
