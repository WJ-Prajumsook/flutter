class Currency {
  final String? symbol;
  final String? name;
  final String? symbolNative;
  final String? code;
  final String? namePlural;

  Currency({
    this.symbol,
    this.name,
    this.symbolNative,
    this.code,
    this.namePlural,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      symbol: json['symbol'],
      name: json['name'],
      symbolNative: json['symbol_native'],
      code: json['code'],
      namePlural: json['name_plural'],
    );
  }
}
