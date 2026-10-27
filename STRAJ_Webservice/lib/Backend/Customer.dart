class Customer{
  final String mnemonic;
  final String shortName;
  final String name;
  final String sector;
  final String language;
  final String reside;
  final String nationality;
  const Customer({required this.mnemonic, required this.shortName, required this.name, required this.sector, required this.language, required this.reside, required this.nationality,});

  factory Customer.fromJson(Map<String, dynamic> data) => Customer(
    mnemonic: data['mnemonic'] as String? ?? '',
    shortName: data['shortName'] as String? ?? '',
    name: data['name'] as String? ?? '',
    sector: data['sector'] as String? ?? '',
    language: data['language'] as String? ?? '',
    reside: data['reside'] as String? ?? '',
    nationality: data['nationality'] as String? ?? '',
  );

  Map<String, dynamic> toJson() => {
    'mnemonic': mnemonic,
    'shortName': shortName,
    'name': name,
    'sector': sector,
    'language': language,
    'reside': reside,
    'nationality': nationality,
  };
}
