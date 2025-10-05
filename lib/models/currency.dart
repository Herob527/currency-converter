const defaultCurrencyCode = "PLN";

class Currency {
  int big;
  int small;
  String code;

  Currency({required this.small, required this.big, required this.code});

  Currency copyWith({int? newSmall, int? newBig, String? newCode}) => Currency(
    small: newSmall ?? small,
    big: newBig ?? big,
    code: newCode ?? code,
  );

  double toDouble() => big + small / 100;

  @override
  String toString() {
    return "$big,${small.toString().padLeft(2, '0')} $code";
  }
}
