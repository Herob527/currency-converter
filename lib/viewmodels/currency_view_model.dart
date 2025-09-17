import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency/models/currency.dart';

class CurrencyCubit extends Cubit<Currency> {
  CurrencyCubit()
    : super(Currency(small: 0, big: 0, code: defaultCurrencyCode));

  void decrement() {
    int newVal = state.small - 1;
    if (state.big == 0 && newVal < 0) {
      return;
    }
    if (state.big > 0 && newVal < 0) {
      emit(state.withCurrency(newBig: state.big - 1, newSmall: 99));
      return;
    }
    emit(state.withCurrency(newSmall: state.small - 1));
  }

  void increment() {
    int newVal = state.small + 1;
    if (newVal > 99) {
      emit(state.withCurrency(newBig: state.big + 1, newSmall: 0));
      return;
    }
    emit(state.withCurrency(newSmall: state.small + 1));
  }
}
