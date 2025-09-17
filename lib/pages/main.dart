import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency/constants.dart';
import 'package:flutter_currency/models/currency.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CurrencyCubit>();
    return Scaffold(
      body: BlocBuilder<CurrencyCubit, Currency>(
        builder: (context, currency) => Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Country.poland.getFlag(),
                  Text(
                    currency.toString(),
                    style: const TextStyle(fontSize: 32),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 16,
                children: [
                  for (var val in conversionMapToPln.entries)
                    Row(
                      spacing: 8,
                      children: [
                        val.key.getFlag(),
                        Text(
                          "${(currency.toDouble() / val.value).toStringAsFixed(2)} ${val.key.currency}",
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text("Currency")),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 16,
        children: <Widget>[
          FloatingActionButton.small(
            child: const Icon(Icons.plus_one),
            onPressed: () {
              cubit.increment();
            },
          ),

          FloatingActionButton.small(
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () {
              cubit.decrement();
            },
          ),
        ],
      ),
    );
  }
}
