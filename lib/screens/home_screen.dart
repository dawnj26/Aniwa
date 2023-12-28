import 'package:flutter/material.dart';

import '../components/anime_card.dart';
import '../helpers/db_helper.dart';
import '../models/anime.dart';
import '../models/animes.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;

  void updateAnime(Anime a) {
    DBhelper.update(a.toMap());
    setState(() {});
  }

  void addAnime(Media media, String cat) async {
    int totalEps = 0;
    if (media.episodes != null) {
      totalEps = media.episodes!.toInt();
    }
    var anime = Anime(
      id: media.id!.toInt(),
      title: media.title!.romaji!,
      category: cat,
      coverImage: media.coverImage!.large!,
      totalEpisodes: totalEps,
      currentEpisode: cat == 'Finished' ? totalEps : 0,
    );

    await DBhelper.insert(anime.toMapWithoutDate());

    showSnack();
    setState(() {});
  }

  void showSnack() {
    const snackBar = SnackBar(
      content: Text('Added successfully'),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void deleteAnime(int id, BuildContext context1) {
    showDialog(
        context: context1,
        builder: (context) {
          return AlertDialog(
              title: const Text('Delete'),
              content:
                  const Text('Are you sure you want to delete this anime?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () {
                      DBhelper.delete(id);
                      setState(() {});
                      Navigator.of(context).pop();
                      Navigator.of(context1).pop();
                    },
                    child: const Text('Delete'))
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    DBhelper.queryAllRows();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => SearchScreen(addAnime)),
          );
        },
        backgroundColor: const Color(0xffBA1A1A),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedIndex: currentIndex,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.tv),
              icon: Icon(Icons.tv_outlined),
              label: 'Watching',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.edit_calendar),
              icon: Icon(Icons.edit_calendar_outlined),
              label: 'Plan to watch',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.check_circle),
              icon: Icon(Icons.check_circle_outline),
              label: 'Finished',
            ),
          ]),
      appBar: AppBar(
        title: const Text('AniWatch'),
        centerTitle: true,
      ),
      body: <Widget>[
        // Watching section
        FutureBuilder(
          future: DBhelper.queryCategory('Watching'),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            var animes = snapshot.data;
            if (animes == null) {
              return const Center(
                child: Text("No anime"),
              );
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (_, i) {
                Anime anime = Anime.fromMap(animes[i]);
                return AnimeCardWatch(
                    'Watching', anime, updateAnime, deleteAnime);
              },
              itemCount: animes.length,
            );
          },
        ),

        // Plan to watch section
        FutureBuilder(
          future: DBhelper.queryCategory('Plan to watch'),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            var animes = snapshot.data;
            if (animes == null) {
              return const Center(
                child: Text("No anime"),
              );
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (_, i) {
                Anime anime = Anime.fromMap(animes[i]);
                return AnimeCardWatch(
                    'Plan to watch', anime, updateAnime, deleteAnime);
              },
              itemCount: animes.length,
            );
          },
        ),
        // Finished section
        FutureBuilder(
          future: DBhelper.queryCategory('Finished'),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            var animes = snapshot.data;
            if (animes == null) {
              return const Center(
                child: Text("No anime"),
              );
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (_, i) {
                Anime anime = Anime.fromMap(animes[i]);
                return AnimeCardWatch(
                    'Finished', anime, updateAnime, deleteAnime);
              },
              itemCount: animes.length,
            );
          },
        ),
      ][currentIndex],
    );
  }
}
