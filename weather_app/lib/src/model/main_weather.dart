class MainWeather {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  MainWeather(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  factory MainWeather.fromJson(dynamic json) {
    if (json == null) {
      return MainWeather();
    }

    return MainWeather(
      temp: json['temp'],
      feelsLike: double.parse(json['feels_like'].toString()),
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}
