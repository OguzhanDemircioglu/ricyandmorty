class CharactersModel {
  CharacterInfo info;
  List<Character> results;

  CharactersModel({required this.info, required this.results});

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      info: CharacterInfo.fromJson(json['info']),
      results:
          (json['results'] as List)
              .map((item) => Character.fromJson(item))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'info': info.toJson(),
    'results': results.map((c) => c.toJson()).toList(),
  };
}

class CharacterInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  CharacterInfo(this.count, this.pages, this.next, this.prev);

  factory CharacterInfo.fromJson(Map<String, dynamic> json) {
    return CharacterInfo(
      json['count'],
      json['pages'],
      json['next'],
      json['prev'],
    );
  }

  Map<String, dynamic> toJson() => {
    'count': count,
    'pages': pages,
    'next': next,
    'prev': prev,
  };
}

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: Location.fromJson(json['origin']),
      location: Location.fromJson(json['location']),
      image: json['image'],
      episode: List<String>.from(json['episode']),
      url: json['url'],
      created: json['created'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'status': status,
    'species': species,
    'type': type,
    'gender': gender,
    'origin': origin.toJson(),
    'location': location.toJson(),
    'image': image,
    'episode': episode,
    'url': url,
    'created': created,
  };
}

class Location {
  final String name;
  final String url;

  Location({required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(name: json['name'], url: json['url']);
  }

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}
