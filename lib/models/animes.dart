/// data : {"Page":{"pageInfo":{"total":5000,"currentPage":1,"lastPage":833,"hasNextPage":true,"perPage":6},"media":[{"id":113415,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx113415-bbBWj4pEFseh.jpg"},"title":{"romaji":"Jujutsu Kaisen"},"description":"A boy fights... for \"the right death.\"<br>\n<br>\nHardship, regret, shame: the negative feelings that humans feel become Curses that lurk in our everyday lives. The Curses run rampant throughout the world, capable of leading people to terrible misfortune and even death. What's more, the Curses can only be exorcised by another Curse.<br>\n<br>\nItadori Yuji is a boy with tremendous physical strength, though he lives a completely ordinary high school life. One day, to save a friend who has been attacked by Curses, he eats the finger of the Double-Faced Specter, taking the Curse into his own soul. From then on, he shares one body with the Double-Faced Specter. Guided by the most powerful of sorcerers, Gojou Satoru, Itadori is admitted to the Tokyo Metropolitan Technical High School of Sorcery, an organization that fights the Curses... and thus begins the heroic tale of a boy who became a Curse to exorcise a Curse, a life from which he could never turn back.\n<br><br>\n(Source: Crunchyroll)<br>\n<br>\n<i>Note: The first episode received an early web premiere on September 19th, 2020. The regular TV broadcast started on October 3rd, 2020.</i>","meanScore":86,"episodes":24,"genres":["Action","Drama","Supernatural"]},{"id":147463,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/b147463-LmoLwL9DbYAn.jpg"},"title":{"romaji":"Jujutsu Kaisen PV"},"description":"PV1 (『呪術廻戦』公式PV　第一弾「虎杖」篇（c.v.中村悠一）) features Satoru Gojo's animation and manga panels, and explaining about series main character Yuji Itadori.\n<br><br>\nPV2 (『呪術廻戦』公式PV　第二弾「同級生」篇（c.v.中村悠一）) features Satoru Gojo's animation and manga panels, and explaining about series main characters Megumi Fushiguro and Nobara Kugisaki.\n<br><br>\nPV3 (『呪術廻戦』公式PV　第三弾「呪術高専」篇（c.v.中村悠一）) features Satoru Gojo's animation and manga panels, and explaining about series sorcerer school and curses.","meanScore":66,"episodes":3,"genres":["Supernatural"]},{"id":131573,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx131573-rpl82vDEDRm6.jpg"},"title":{"romaji":"Jujutsu Kaisen 0"},"description":"Yuta Okkotsu is a nervous high school student who is suffering from a serious problem—his childhood friend Rika has turned into a curse and won't leave him alone. Since Rika is no ordinary curse, his plight is noticed by Satoru Gojo, a teacher at Jujutsu High, a school where fledgling exorcists learn how to combat curses. Gojo convinces Yuta to enroll, but can he learn enough in time to confront the curse that haunts him?\n<br><br>\n(Source: Viz Media)","meanScore":85,"episodes":1,"genres":["Action","Supernatural"]},{"id":145064,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx145064-5fa4ZBbW4dqA.jpg"},"title":{"romaji":"Jujutsu Kaisen 2nd Season"},"description":"The second season of <i>Jujutsu Kaisen</i>.<br>\n<br>\nThe past comes to light when second-year students Satoru Gojou and Suguru Getou are tasked with escorting young Riko Amanai to Master Tengen. But when a non-sorcerer user tries to kill them, their mission to protect the Star Plasma Vessel threatens to turn them into bitter enemies and cement their destinies—one as the world’s strongest sorcerer, and the other its most twisted curse user!<br>\n<br>\n(Source: Crunchyroll)","meanScore":88,"episodes":23,"genres":["Action","Drama","Supernatural"]},{"id":148515,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx148515-vKI7wNTFDaFl.png"},"title":{"romaji":"Bijutsu Kyouiku"},"description":"A graduation silent short film by Megumi Ishitani, depicting the conflict between two artists and their mentees.","meanScore":52,"episodes":1,"genres":["Comedy","Romance"]},{"id":21561,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/21561-RzmwLDfqEsKW.png"},"title":{"romaji":"Inyutsu no Yakata THE ANIMATION"},"description":"Meru is a sister from an Elf family who wants to find her sister Syl who suddenly disappears. After finding out where her sister was located, her sister was in a Villa desire satisfaction where the Villa could satisfy the desire of lust with many of the Tentacles in it. Meru is trapped inside the villa with many Tentacle.<br>\n<br>\n(Source: Nekopoi and Has Been Translated and Edited)","meanScore":57,"episodes":1,"genres":["Hentai"]}]}}

class AnimeResult {
  AnimeResult({
    Data? data,
  }) {
    _data = data;
  }

  AnimeResult.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Data? _data;

  AnimeResult copyWith({
    Data? data,
  }) =>
      AnimeResult(
        data: data ?? _data,
      );

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// Page : {"pageInfo":{"total":5000,"currentPage":1,"lastPage":833,"hasNextPage":true,"perPage":6},"media":[{"id":113415,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx113415-bbBWj4pEFseh.jpg"},"title":{"romaji":"Jujutsu Kaisen"},"description":"A boy fights... for \"the right death.\"<br>\n<br>\nHardship, regret, shame: the negative feelings that humans feel become Curses that lurk in our everyday lives. The Curses run rampant throughout the world, capable of leading people to terrible misfortune and even death. What's more, the Curses can only be exorcised by another Curse.<br>\n<br>\nItadori Yuji is a boy with tremendous physical strength, though he lives a completely ordinary high school life. One day, to save a friend who has been attacked by Curses, he eats the finger of the Double-Faced Specter, taking the Curse into his own soul. From then on, he shares one body with the Double-Faced Specter. Guided by the most powerful of sorcerers, Gojou Satoru, Itadori is admitted to the Tokyo Metropolitan Technical High School of Sorcery, an organization that fights the Curses... and thus begins the heroic tale of a boy who became a Curse to exorcise a Curse, a life from which he could never turn back.\n<br><br>\n(Source: Crunchyroll)<br>\n<br>\n<i>Note: The first episode received an early web premiere on September 19th, 2020. The regular TV broadcast started on October 3rd, 2020.</i>","meanScore":86,"episodes":24,"genres":["Action","Drama","Supernatural"]},{"id":147463,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/b147463-LmoLwL9DbYAn.jpg"},"title":{"romaji":"Jujutsu Kaisen PV"},"description":"PV1 (『呪術廻戦』公式PV　第一弾「虎杖」篇（c.v.中村悠一）) features Satoru Gojo's animation and manga panels, and explaining about series main character Yuji Itadori.\n<br><br>\nPV2 (『呪術廻戦』公式PV　第二弾「同級生」篇（c.v.中村悠一）) features Satoru Gojo's animation and manga panels, and explaining about series main characters Megumi Fushiguro and Nobara Kugisaki.\n<br><br>\nPV3 (『呪術廻戦』公式PV　第三弾「呪術高専」篇（c.v.中村悠一）) features Satoru Gojo's animation and manga panels, and explaining about series sorcerer school and curses.","meanScore":66,"episodes":3,"genres":["Supernatural"]},{"id":131573,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx131573-rpl82vDEDRm6.jpg"},"title":{"romaji":"Jujutsu Kaisen 0"},"description":"Yuta Okkotsu is a nervous high school student who is suffering from a serious problem—his childhood friend Rika has turned into a curse and won't leave him alone. Since Rika is no ordinary curse, his plight is noticed by Satoru Gojo, a teacher at Jujutsu High, a school where fledgling exorcists learn how to combat curses. Gojo convinces Yuta to enroll, but can he learn enough in time to confront the curse that haunts him?\n<br><br>\n(Source: Viz Media)","meanScore":85,"episodes":1,"genres":["Action","Supernatural"]},{"id":145064,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx145064-5fa4ZBbW4dqA.jpg"},"title":{"romaji":"Jujutsu Kaisen 2nd Season"},"description":"The second season of <i>Jujutsu Kaisen</i>.<br>\n<br>\nThe past comes to light when second-year students Satoru Gojou and Suguru Getou are tasked with escorting young Riko Amanai to Master Tengen. But when a non-sorcerer user tries to kill them, their mission to protect the Star Plasma Vessel threatens to turn them into bitter enemies and cement their destinies—one as the world’s strongest sorcerer, and the other its most twisted curse user!<br>\n<br>\n(Source: Crunchyroll)","meanScore":88,"episodes":23,"genres":["Action","Drama","Supernatural"]},{"id":148515,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx148515-vKI7wNTFDaFl.png"},"title":{"romaji":"Bijutsu Kyouiku"},"description":"A graduation silent short film by Megumi Ishitani, depicting the conflict between two artists and their mentees.","meanScore":52,"episodes":1,"genres":["Comedy","Romance"]},{"id":21561,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/21561-RzmwLDfqEsKW.png"},"title":{"romaji":"Inyutsu no Yakata THE ANIMATION"},"description":"Meru is a sister from an Elf family who wants to find her sister Syl who suddenly disappears. After finding out where her sister was located, her sister was in a Villa desire satisfaction where the Villa could satisfy the desire of lust with many of the Tentacles in it. Meru is trapped inside the villa with many Tentacle.<br>\n<br>\n(Source: Nekopoi and Has Been Translated and Edited)","meanScore":57,"episodes":1,"genres":["Hentai"]}]}

class Data {
  Data({
    Page? page,
  }) {
    _page = page;
  }

  Data.fromJson(dynamic json) {
    _page = json['Page'] != null ? Page.fromJson(json['Page']) : null;
  }

  Page? _page;

  Data copyWith({
    Page? page,
  }) =>
      Data(
        page: page ?? _page,
      );

  Page? get page => _page;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_page != null) {
      map['Page'] = _page?.toJson();
    }
    return map;
  }
}

/// pageInfo : {"total":5000,"currentPage":1,"lastPage":833,"hasNextPage":true,"perPage":6}
/// media : [{"id":113415,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx113415-bbBWj4pEFseh.jpg"},"title":{"romaji":"Jujutsu Kaisen"},"description":"A boy fights... for \"the right death.\"<br>\n<br>\nHardship, regret, shame: the negative feelings that humans feel become Curses that lurk in our everyday lives. The Curses run rampant throughout the world, capable of leading people to terrible misfortune and even death. What's more, the Curses can only be exorcised by another Curse.<br>\n<br>\nItadori Yuji is a boy with tremendous physical strength, though he lives a completely ordinary high school life. One day, to save a friend who has been attacked by Curses, he eats the finger of the Double-Faced Specter, taking the Curse into his own soul. From then on, he shares one body with the Double-Faced Specter. Guided by the most powerful of sorcerers, Gojou Satoru, Itadori is admitted to the Tokyo Metropolitan Technical High School of Sorcery, an organization that fights the Curses... and thus begins the heroic tale of a boy who became a Curse to exorcise a Curse, a life from which he could never turn back.\n<br><br>\n(Source: Crunchyroll)<br>\n<br>\n<i>Note: The first episode received an early web premiere on September 19th, 2020. The regular TV broadcast started on October 3rd, 2020.</i>","meanScore":86,"episodes":24,"genres":["Action","Drama","Supernatural"]},{"id":147463,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/b147463-LmoLwL9DbYAn.jpg"},"title":{"romaji":"Jujutsu Kaisen PV"},"description":"PV1 (『呪術廻戦』公式PV　第一弾「虎杖」篇（c.v.中村悠一）) features Satoru Gojo's animation and manga panels, and explaining about series main character Yuji Itadori.\n<br><br>\nPV2 (『呪術廻戦』公式PV　第二弾「同級生」篇（c.v.中村悠一）) features Satoru Gojo's animation and manga panels, and explaining about series main characters Megumi Fushiguro and Nobara Kugisaki.\n<br><br>\nPV3 (『呪術廻戦』公式PV　第三弾「呪術高専」篇（c.v.中村悠一）) features Satoru Gojo's animation and manga panels, and explaining about series sorcerer school and curses.","meanScore":66,"episodes":3,"genres":["Supernatural"]},{"id":131573,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx131573-rpl82vDEDRm6.jpg"},"title":{"romaji":"Jujutsu Kaisen 0"},"description":"Yuta Okkotsu is a nervous high school student who is suffering from a serious problem—his childhood friend Rika has turned into a curse and won't leave him alone. Since Rika is no ordinary curse, his plight is noticed by Satoru Gojo, a teacher at Jujutsu High, a school where fledgling exorcists learn how to combat curses. Gojo convinces Yuta to enroll, but can he learn enough in time to confront the curse that haunts him?\n<br><br>\n(Source: Viz Media)","meanScore":85,"episodes":1,"genres":["Action","Supernatural"]},{"id":145064,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx145064-5fa4ZBbW4dqA.jpg"},"title":{"romaji":"Jujutsu Kaisen 2nd Season"},"description":"The second season of <i>Jujutsu Kaisen</i>.<br>\n<br>\nThe past comes to light when second-year students Satoru Gojou and Suguru Getou are tasked with escorting young Riko Amanai to Master Tengen. But when a non-sorcerer user tries to kill them, their mission to protect the Star Plasma Vessel threatens to turn them into bitter enemies and cement their destinies—one as the world’s strongest sorcerer, and the other its most twisted curse user!<br>\n<br>\n(Source: Crunchyroll)","meanScore":88,"episodes":23,"genres":["Action","Drama","Supernatural"]},{"id":148515,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx148515-vKI7wNTFDaFl.png"},"title":{"romaji":"Bijutsu Kyouiku"},"description":"A graduation silent short film by Megumi Ishitani, depicting the conflict between two artists and their mentees.","meanScore":52,"episodes":1,"genres":["Comedy","Romance"]},{"id":21561,"coverImage":{"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/21561-RzmwLDfqEsKW.png"},"title":{"romaji":"Inyutsu no Yakata THE ANIMATION"},"description":"Meru is a sister from an Elf family who wants to find her sister Syl who suddenly disappears. After finding out where her sister was located, her sister was in a Villa desire satisfaction where the Villa could satisfy the desire of lust with many of the Tentacles in it. Meru is trapped inside the villa with many Tentacle.<br>\n<br>\n(Source: Nekopoi and Has Been Translated and Edited)","meanScore":57,"episodes":1,"genres":["Hentai"]}]

class Page {
  Page({
    PageInfo? pageInfo,
    List<Media>? media,
  }) {
    _pageInfo = pageInfo;
    _media = media;
  }

  Page.fromJson(dynamic json) {
    _pageInfo =
        json['pageInfo'] != null ? PageInfo.fromJson(json['pageInfo']) : null;
    if (json['media'] != null) {
      _media = [];
      json['media'].forEach((v) {
        _media?.add(Media.fromJson(v));
      });
    }
  }

  PageInfo? _pageInfo;
  List<Media>? _media;

  Page copyWith({
    PageInfo? pageInfo,
    List<Media>? media,
  }) =>
      Page(
        pageInfo: pageInfo ?? _pageInfo,
        media: media ?? _media,
      );

  PageInfo? get pageInfo => _pageInfo;

  List<Media>? get media => _media;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_pageInfo != null) {
      map['pageInfo'] = _pageInfo?.toJson();
    }
    if (_media != null) {
      map['media'] = _media?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 113415
/// coverImage : {"large":"https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx113415-bbBWj4pEFseh.jpg"}
/// title : {"romaji":"Jujutsu Kaisen"}
/// description : "A boy fights... for \"the right death.\"<br>\n<br>\nHardship, regret, shame: the negative feelings that humans feel become Curses that lurk in our everyday lives. The Curses run rampant throughout the world, capable of leading people to terrible misfortune and even death. What's more, the Curses can only be exorcised by another Curse.<br>\n<br>\nItadori Yuji is a boy with tremendous physical strength, though he lives a completely ordinary high school life. One day, to save a friend who has been attacked by Curses, he eats the finger of the Double-Faced Specter, taking the Curse into his own soul. From then on, he shares one body with the Double-Faced Specter. Guided by the most powerful of sorcerers, Gojou Satoru, Itadori is admitted to the Tokyo Metropolitan Technical High School of Sorcery, an organization that fights the Curses... and thus begins the heroic tale of a boy who became a Curse to exorcise a Curse, a life from which he could never turn back.\n<br><br>\n(Source: Crunchyroll)<br>\n<br>\n<i>Note: The first episode received an early web premiere on September 19th, 2020. The regular TV broadcast started on October 3rd, 2020.</i>"
/// meanScore : 86
/// episodes : 24
/// genres : ["Action","Drama","Supernatural"]

class Media {
  Media({
    num? id,
    CoverImage? coverImage,
    Title? title,
    String? description,
    num? meanScore,
    num? episodes,
    List<String>? genres,
  }) {
    _id = id;
    _coverImage = coverImage;
    _title = title;
    _description = description;
    _meanScore = meanScore;
    _episodes = episodes;
    _genres = genres;
  }

  Media.fromJson(dynamic json) {
    _id = json['id'];
    _coverImage = json['coverImage'] != null
        ? CoverImage.fromJson(json['coverImage'])
        : null;
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
    _description = json['description'];
    _meanScore = json['meanScore'];
    _episodes = json['episodes'];
    _genres = json['genres'] != null ? json['genres'].cast<String>() : [];
  }

  num? _id;
  CoverImage? _coverImage;
  Title? _title;
  String? _description;
  num? _meanScore;
  num? _episodes;
  List<String>? _genres;

  Media copyWith({
    num? id,
    CoverImage? coverImage,
    Title? title,
    String? description,
    num? meanScore,
    num? episodes,
    List<String>? genres,
  }) =>
      Media(
        id: id ?? _id,
        coverImage: coverImage ?? _coverImage,
        title: title ?? _title,
        description: description ?? _description,
        meanScore: meanScore ?? _meanScore,
        episodes: episodes ?? _episodes,
        genres: genres ?? _genres,
      );

  num? get id => _id;

  CoverImage? get coverImage => _coverImage;

  Title? get title => _title;

  String? get description => _description;

  num? get meanScore => _meanScore;

  num? get episodes => _episodes;

  List<String>? get genres => _genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_coverImage != null) {
      map['coverImage'] = _coverImage?.toJson();
    }
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    map['description'] = _description;
    map['meanScore'] = _meanScore;
    map['episodes'] = _episodes;
    map['genres'] = _genres;
    return map;
  }
}

/// romaji : "Jujutsu Kaisen"

class Title {
  Title({
    String? romaji,
  }) {
    _romaji = romaji;
  }

  Title.fromJson(dynamic json) {
    _romaji = json['romaji'];
  }

  String? _romaji;

  Title copyWith({
    String? romaji,
  }) =>
      Title(
        romaji: romaji ?? _romaji,
      );

  String? get romaji => _romaji;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['romaji'] = _romaji;
    return map;
  }
}

/// large : "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx113415-bbBWj4pEFseh.jpg"

class CoverImage {
  CoverImage({
    String? large,
  }) {
    _large = large;
  }

  CoverImage.fromJson(dynamic json) {
    _large = json['large'];
  }

  String? _large;

  CoverImage copyWith({
    String? large,
  }) =>
      CoverImage(
        large: large ?? _large,
      );

  String? get large => _large;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['large'] = _large;
    return map;
  }
}

/// total : 5000
/// currentPage : 1
/// lastPage : 833
/// hasNextPage : true
/// perPage : 6

class PageInfo {
  PageInfo({
    num? total,
    num? currentPage,
    num? lastPage,
    bool? hasNextPage,
    num? perPage,
  }) {
    _total = total;
    _currentPage = currentPage;
    _lastPage = lastPage;
    _hasNextPage = hasNextPage;
    _perPage = perPage;
  }

  PageInfo.fromJson(dynamic json) {
    _total = json['total'];
    _currentPage = json['currentPage'];
    _lastPage = json['lastPage'];
    _hasNextPage = json['hasNextPage'];
    _perPage = json['perPage'];
  }

  num? _total;
  num? _currentPage;
  num? _lastPage;
  bool? _hasNextPage;
  num? _perPage;

  PageInfo copyWith({
    num? total,
    num? currentPage,
    num? lastPage,
    bool? hasNextPage,
    num? perPage,
  }) =>
      PageInfo(
        total: total ?? _total,
        currentPage: currentPage ?? _currentPage,
        lastPage: lastPage ?? _lastPage,
        hasNextPage: hasNextPage ?? _hasNextPage,
        perPage: perPage ?? _perPage,
      );

  num? get total => _total;

  num? get currentPage => _currentPage;

  num? get lastPage => _lastPage;

  bool? get hasNextPage => _hasNextPage;

  num? get perPage => _perPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['currentPage'] = _currentPage;
    map['lastPage'] = _lastPage;
    map['hasNextPage'] = _hasNextPage;
    map['perPage'] = _perPage;
    return map;
  }
}
