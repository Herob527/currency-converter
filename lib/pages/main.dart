import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency/models/currency.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CurrencyCubit, Currency>(
        builder: (context, test) => Center(child: Text(test.small.toString())),
      ),
      appBar: AppBar(title: Text("Currency")),
      floatingActionButton: Row(
        children: <Widget>[
          FloatingActionButton.small(
            child: const Icon(Icons.plus_one),
            onPressed: () {
              context.read<CurrencyCubit>().increment();
            },
          ),

          FloatingActionButton.small(
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () {
              context.read<CurrencyCubit>().decrement();
            },
          ),
        ],
      ),
    );
  }
}
