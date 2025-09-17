import 'package:flutter_bloc/flutter_bloc.dart';

class Currency {
  int big;
  int small;
  String code;

  Currency({required this.small, required this.big, required this.code});

  Currency withCurrency({int? newSmall, int? newBig, String? newCode}) =>
      Currency(
        small: newSmall ?? small,
        big: newBig ?? big,
        code: newCode ?? code,
      );
}

class CurrencyCubit extends Cubit<Currency> {
  CurrencyCubit() : super(Currency(small: 0, big: 0, code: ""));

  void increment() => emit(state.withCurrency(newSmall: state.small + 1));
  void decrement() => emit(state.withCurrency(newSmall: state.small - 1));
}
