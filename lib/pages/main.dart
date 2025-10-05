import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency/constants.dart';
import 'package:flutter_currency/cubits/future_cubit.dart';
import 'package:flutter_currency/models/currency.dart';
import 'package:flutter_currency/models/currency_rate.dart';
import 'package:flutter_currency/models/currency_response.dart';
import 'package:flutter_currency/cubits/currency_cubit.dart';

Widget dataView(List<CurrencyRate> rates, Currency currency) => Expanded(
  child: SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.black, width: 2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 16,
        children: [
          for (var val in rates)
            Row(
              spacing: 8,
              children: [
                Text(val.code),
                Text(
                  "${(currency.toDouble() / val.mid).toStringAsFixed(2)} ${val.currency}",
                ),
              ],
            ),
        ],
      ),
    ),
  ),
);

Widget noDataView() => const Text("No Data");

Widget loadingView() => const CircularProgressIndicator();

Widget errorView() => const Text("Error");

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyCubit = context.read<CurrencyCubit>();
    final futureCubit = context.read<FutureCubit<CurrencyResponseModel?>>();

    return Scaffold(
      body: BlocBuilder<CurrencyCubit, Currency>(
        builder: (context, currency) => Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  Country.poland.getFlag(),
                  Text(
                    currency.toString(),
                    style: const TextStyle(fontSize: 32),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      MaterialButton(
                        color: Colors.red,
                        child: const Icon(Icons.exposure_minus_1),
                        onPressed: () => currencyCubit.decrement(),
                      ),
                      MaterialButton(
                        color: Colors.blue,
                        child: const Icon(Icons.plus_one),
                        onPressed: () => currencyCubit.increment(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            switch (futureCubit.state.status) {
              FutureStatus.pending => loadingView(),
              FutureStatus.loading => loadingView(),
              FutureStatus.failure => errorView(),
              FutureStatus.success =>
                futureCubit.state.data == null
                    ? noDataView()
                    : dataView(
                        futureCubit.state.data!.rates,
                        currencyCubit.state,
                      ),
            },
          ],
        ),
      ),
      appBar: AppBar(title: Text("Currency")),
    );
  }
}
