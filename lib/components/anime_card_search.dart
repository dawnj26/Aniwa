import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../models/animes.dart';
import '../screens/add_screen.dart';

class AnimeCardSearch extends StatelessWidget {
  const AnimeCardSearch(this.media, this.addAnime, {super.key});

  final Media media;
  final void Function(Media media, String cat) addAnime;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          TileWithHeader(media),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => AddScreen(media, addAnime)),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class TileWithHeader extends StatelessWidget {
  const TileWithHeader(
    this.media, {
    super.key,
  });

  final Media media;

  @override
  Widget build(BuildContext context) {
    var score = '${media.meanScore} / 100';
    return GridTile(
      footer: GridTileBar(
        title: Text(media.title!.romaji!),
      ),
      header: GridTileBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xffBA1A1A),
              ),
              child: Row(
                children: [
                  Text(
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 12.0),
                    score,
                  ),
                  const Gap(4.0),
                  const Icon(
                    Icons.star,
                    size: 10.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(media.coverImage!.large!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.grey.withOpacity(0.0),
                  Colors.black.withOpacity(0.85),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
