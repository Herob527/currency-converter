import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency/cubits/future_cubit.dart';
import 'package:flutter_currency/models/currency_response.dart';

import 'package:flutter_currency/pages/main.dart';
import 'package:flutter_currency/cubits/currency_cubit.dart';

void main() {
  runApp(const MyApp());
}

final dio = Dio();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => CurrencyCubit()),
          BlocProvider(
            create: (BuildContext context) =>
                FutureCubit<CurrencyResponseModel?>(),
          ),
        ],
        child: MyHomePage(),
      ),
    );
  }
}
