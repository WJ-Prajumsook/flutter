class Person {
  final String id;
  final String gender;
  final String name;
  final String profilePath;
  final String knowForDepartment;
  final String popularity;

  Person(
      {this.id,
      this.gender,
      this.name,
      this.profilePath,
      this.knowForDepartment,
      this.popularity});

  factory Person.fromJson(dynamic json) {
    if (json == null) {
      return Person();
    }

    return Person(
        id: json['id'].toString(),
        gender: json['gender'].toString(),
        name: json['name'],
        profilePath: json['profile_path'],
        knowForDepartment: json['known_for_department'],
        popularity: json['popularity'].toString());
  }
}
