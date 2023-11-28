// Model

class CountryModel {
  final String name;
  final String dialCode;
  final String countryCode;
  final String emoji;
  final String flagUri;
  bool isSelected;

  CountryModel({
    required this.name,
    required this.dialCode,
    required this.countryCode,
    required this.emoji,
    required this.flagUri,
    required this.isSelected,
  });
}
