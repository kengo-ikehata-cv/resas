class City {
  final int prefCode;
  final String cityCode;
  final String cityName;
  final String bigCityFlag;

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      prefCode: json['prefCode'] as int,
      cityCode: json['cityCode'] as String,
      cityName: json['cityName'] as String,
      bigCityFlag: json['bigCityFlag'] as String,
    );
  }
  
  City({
    required this.prefCode,
    required this.cityCode,
    required this.cityName,
    required this.bigCityFlag,
  });
}