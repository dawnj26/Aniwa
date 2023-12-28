import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;

import '../components/anime_card_search.dart';
import '../models/animes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen(this.addAnime, {super.key});

  final void Function(Media media, String cat) addAnime;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();
  var currentPage = 1;
  var count = 0;

  void clearSearch() {
    if (searchController.text.isEmpty) {
      return;
    }
    setState(() {
      searchController.text = '';
    });
  }

  Future<AnimeResult> fetchAnime(String search) async {
    String query = r'''
    query ($id: Int, $page: Int, $search: String) {
      Page(page: $page, perPage: 10) {
        pageInfo {
          total
          currentPage
          lastPage
          hasNextPage
          perPage
        }
        media(id: $id, search: $search, type: ANIME, isAdult: false) {
          id
          coverImage {
            large
          }
          title {
            romaji
          }
          description
          meanScore
          episodes
          genres
    
        }
      }
    }
    ''';

    Map<String, dynamic> variables = {
      'search': search,
      'page': currentPage,
    };

    var url = Uri.parse(r'https://graphql.anilist.co');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'query': query,
          'variables': variables,
        }));

    if (response.statusCode == 200) {
      return AnimeResult.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load anime');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search anime'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchBar(
              controller: searchController,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              leading: const Icon(Icons.search),
              trailing: [
                IconButton(
                    onPressed: clearSearch, icon: const Icon(Icons.clear))
              ],
              onSubmitted: (s) {
                count++;
                setState(() {});
              },
            ),
            const Gap(16.0),

            Expanded(
              child: FutureBuilder<AnimeResult>(
                  future: fetchAnime(searchController.text),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && count > 0) {
                      var anime = snapshot.data!;
                      var media = anime.data!.page!.media!;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (media.isEmpty) {
                        return const Center(
                          child: Text('No results found'),
                        );
                      }

                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (_, i) {
                          return AnimeCardSearch(media[i], widget.addAnime);
                        },
                        itemCount: media.length,
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    return const Center(
                      child: Text('Search anything'),
                    );
                  }),
            ),
            // Expanded(
            //   child: GridView(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       childAspectRatio: 0.7,
            //     ),
            //     children: [
            //       const AnimeCardSearch(),
            //       const AnimeCardSearch(),
            //       const AnimeCardSearch(),
            //       const AnimeCardSearch(),
            //       const AnimeCardSearch(),
            //       const AnimeCardSearch(),
            //       const AnimeCardSearch(),
            //       const AnimeCardSearch(),
            //       const AnimeCardSearch(),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
