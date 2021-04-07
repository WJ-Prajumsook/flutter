class Genre {
  final int id;
  final String name;

  String error;

  Genre({this.id, this.name});

  factory Genre.fromJson(dynamic json) {
    if (json == null) {
      return Genre();
    }
    return Genre(id: json['id'], name: json['name']);
  }
}
