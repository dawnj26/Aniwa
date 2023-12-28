import 'package:flutter/material.dart';

import '../models/anime.dart';
import '../screens/details_screen.dart';

class AnimeCardWatch extends StatelessWidget {
  const AnimeCardWatch(
      this.type, this.anime, this.updateAnime, this.deleteAnime,
      {super.key});

  final String type;
  final Anime anime;
  final void Function(Anime a) updateAnime;
  final void Function(int id, BuildContext context) deleteAnime;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          type == 'Finished' ? TileWithoutHeader(anime) : TileWithHeader(anime),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) =>
                          DetailsScreen(anime, updateAnime, deleteAnime)),
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
    this.anime, {
    super.key,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    int epsLeft = anime.totalEpisodes - anime.currentEpisode;
    return GridTile(
      footer: GridTileBar(
        title: Text(anime.title),
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
              child: Text(
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 12.0),
                anime.totalEpisodes == 0 ? 'Unknown' : '$epsLeft',
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
                image: NetworkImage(anime.coverImage),
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

class TileWithoutHeader extends StatelessWidget {
  const TileWithoutHeader(
    this.anime, {
    super.key,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        title: Text(anime.title),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(anime.coverImage),
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
