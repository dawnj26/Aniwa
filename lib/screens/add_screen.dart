import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../models/animes.dart';

const listCategory = [
  'Watching',
  'Plan to watch',
  'Finished',
];

class AddScreen extends StatefulWidget {
  const AddScreen(this.media, this.addAnime, {super.key});

  final Media media;
  final void Function(Media media, String cat) addAnime;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var currentCategory = listCategory.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            AnimeHeader(widget.media),
            const Gap(8.0),
            Wrap(
              spacing: 4.0,
              children: widget.media.genres!.map((e) {
                return GenreBadge(e);
              }).toList(),
            ),
            const Gap(8.0),
            Row(
              children: [
                DropdownMenu<String>(
                  width: 250.0,
                  label: const Text('Category'),
                  initialSelection: listCategory.first,
                  onSelected: (s) {
                    currentCategory = s!;
                    setState(() {});
                  },
                  dropdownMenuEntries: listCategory
                      .map((s) => DropdownMenuEntry(value: s, label: s))
                      .toList(),
                ),
                const Gap(8.0),
                ElevatedButton(
                    onPressed: () =>
                        widget.addAnime(widget.media, currentCategory),
                    child: const Text('Add to list'))
              ],
            ),
            const Gap(16.0),
            AboutAnime(text: widget.media.description!),
            const Gap(16.0),
          ],
        ),
      ),
    );
  }
}

class AnimeHeader extends StatelessWidget {
  const AnimeHeader(
    this.media, {
    super.key,
  });

  final Media media;

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
                media.coverImage!.large!,
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
                media.title!.romaji!,
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
                Text(
                    '${media.episodes} episodes | ${media.meanScore} / 100 score'),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class AboutAnime extends StatelessWidget {
  const AboutAnime({
    super.key,
    required this.text,
  });

  final String text;

  String filterDescription(String text) {
    return text.replaceAll(RegExp(r'\n|<[^>]*>|\\'), '');
  }

  @override
  Widget build(BuildContext context) {
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
        filterDescription(text),
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
      expanded: Text(
        filterDescription(text),
        softWrap: true,
      ),
    );
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
