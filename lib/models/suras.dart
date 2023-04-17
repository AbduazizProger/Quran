class Suras {
  final int number;
  final String name;
  final String englishName;
  final int numberOfAyahs;
  final String revelationType;

  Suras({
    required this.number,
    required this.name,
    required this.englishName,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  factory Suras.fromJson(Map<String, dynamic> json) {
    return Suras(
      number: json["number"],
      name: json["name"],
      englishName: json["englishName"],
      numberOfAyahs: json["numberOfAyahs"],
      revelationType: json["revelationType"],
    );
  }
}
