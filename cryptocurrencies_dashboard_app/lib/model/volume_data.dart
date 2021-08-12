class VolumeData {
  double? raw;
  String? fmt;

  VolumeData({
    this.raw,
    this.fmt,
  });

  factory VolumeData.fromJson(Map<String, dynamic> json) {
    return VolumeData(
      raw: json['raw'],
      fmt: json['fmt'],
    );
  }
}