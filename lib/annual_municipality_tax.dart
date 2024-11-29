class AnnualMunicipalityTax {
  final int year;
  final int value;

  factory AnnualMunicipalityTax.fromJson(Map<String, dynamic> json) {
    return AnnualMunicipalityTax(
      year: json['year'] as int,
      value: json['value'] as int,
    );
  }

  AnnualMunicipalityTax({
    required this.year,
    required this.value,
  });
}
