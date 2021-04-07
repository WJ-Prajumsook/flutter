class Sys {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  factory Sys.fromJson(dynamic json) {
    if (json == null) {
      return Sys();
    }

    return Sys(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}
