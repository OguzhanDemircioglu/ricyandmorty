class EpisodeModel {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final DateTime created;

  EpisodeModel({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    //tek numara iletilince episode String dönüyor
    final episodeString = json['episode'] as String;
    final episodeList = episodeString.replaceAll('S', '').split('E');
    return EpisodeModel(
      id: json['id'] as int,
      name: json['name'] as String,
      airDate: json['air_date'] as String,
      episode:
          'Episode ${int.parse(episodeList.first)} Season ${episodeList.last}',
      characters: List<String>.from(json['characters']),
      url: json['url'] as String,
      created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'air_date': airDate,
      'episode': episode,
      'characters': characters,
      'url': url,
      'created': created.toIso8601String(),
    };
  }
}
