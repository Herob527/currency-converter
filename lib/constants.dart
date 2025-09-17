import "package:country_flags/country_flags.dart";
import "package:flutter/widgets.dart";

enum Country {
  poland(name: "Poland", code: "PL", currency: "PLN"),
  unitedStates(name: "United States", code: "US", currency: "USD"),
  europeanUnion(name: "Germany", code: "DEU", currency: "EUR"),
  unitedKingdom(name: "United Kingdom", code: "GB", currency: "GBP"),
  india(name: "India", code: "IN", currency: "INR");

  const Country({
    required this.name,
    required this.currency,
    required this.code,
  });

  final String name;
  final String code;
  final String currency;

  String get countryCurrency => currency;

  Widget getFlag() => CountryFlag.fromCountryCode(
    code,
    theme: const ImageTheme(shape: Circle()),
  );
}

const conversionMapToPln = <Country, double>{
  Country.unitedStates: 3.64,
  Country.europeanUnion: 4.25,
  Country.unitedKingdom: 3.56,
  Country.india: 0.04,
};
