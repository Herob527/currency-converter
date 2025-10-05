import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency/cubits/currency_cubit.dart';
import 'package:flutter_currency/cubits/future_cubit.dart';
import 'package:flutter_currency/models/currency_response.dart';
import 'package:flutter_currency/pages/main.dart';
import 'package:flutter_currency/repositories/currency_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton(CurrencyRepository());
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
          BlocProvider(create: (context) => CurrencyCubit()),
          BlocProvider(
            create: (context) =>
                FutureCubit(queryFn: getIt<CurrencyRepository>().getCurrencies),
          ),
        ],
        child:
            BlocBuilder<
              FutureCubit<CurrencyResponseModel?>,
              FutureState<CurrencyResponseModel?>
            >(builder: (context, state) => MyHomePage()),
      ),
    );
  }
}
