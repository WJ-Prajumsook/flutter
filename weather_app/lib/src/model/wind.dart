class Wind {
  final double speed;
  final int deg;

  Wind({this.speed, this.deg});

  factory Wind.fromJson(dynamic json) {
    if (json == null) {
      return Wind();
    }

    return Wind(
      speed: double.parse(json['speed'].toString()),
      deg: json['deg'],
    );
  }
}
