enum CityType {
  general('一般の市区町村'),
  designatedWard('政令指定都市の区'),
  designatedCity('政令指定都市の市'),
  designatedTokyoWard('東京都23区'),
  ;

  const CityType(this.label);
  final String label;
}