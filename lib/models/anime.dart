class Anime {
  late int id;
  late String title;
  late String coverImage;
  late String category;
  late int totalEpisodes;
  late int currentEpisode;
  late String? startDate;
  late String? endDate;

  Anime(
      {required this.id,
      required this.title,
      required this.coverImage,
      required this.category,
      required this.totalEpisodes,
      required this.currentEpisode,
      this.startDate = '',
      this.endDate = ''});

  Anime.empty() {
    id = 0;
    title = '';
    coverImage = '';
    category = '';
    totalEpisodes = 0;
    currentEpisode = 0;
    startDate = '';
    endDate = '';
  }

  Anime.copyWith(Anime anime) {
    id = anime.id;
    title = anime.title;
    coverImage = anime.coverImage;
    category = anime.category;
    totalEpisodes = anime.totalEpisodes;
    currentEpisode = anime.currentEpisode;
    startDate = anime.startDate;
    endDate = anime.endDate;
  }

  Anime.fromMap(Map<String, dynamic> map) {
    id = map['anime_id'];
    title = map['anime_title'];
    coverImage = map['cover_image'];
    category = map['category'];
    totalEpisodes = map['total_episodes'];
    currentEpisode = map['current_episode'];
    startDate = map['start_date'];
    endDate = map['end_date'];
  }

  Map<String, dynamic> toMap() {
    return {
      'anime_id': id,
      'anime_title': title,
      'category': category,
      'cover_image': coverImage,
      'total_episodes': totalEpisodes,
      'current_episode': currentEpisode,
      'start_date': startDate,
      'end_date': endDate,
    };
  }

  Map<String, dynamic> toMapWithoutDate() {
    return {
      'anime_id': id,
      'anime_title': title,
      'category': category,
      'cover_image': coverImage,
      'total_episodes': totalEpisodes,
      'current_episode': currentEpisode,
    };
  }
}
