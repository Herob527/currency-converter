import 'package:flutter_bloc/flutter_bloc.dart';

enum FutureStatus { pending, loading, success, failure }

class FutureState<DataType> {
  DataType? data;
  FutureStatus status = FutureStatus.pending;

  FutureState({this.data, this.status = FutureStatus.pending});
}

class FutureCubit<DataType> extends Cubit<FutureState<DataType>> {
  FutureCubit() : super(FutureState<DataType>());

  void fetch(Future<DataType> Function() queryFn) {
    emit(FutureState<DataType>(status: FutureStatus.loading));
    queryFn()
        .then((value) {
          emit(
            FutureState<DataType>(data: value, status: FutureStatus.success),
          );
        })
        .catchError((error) {
          emit(FutureState<DataType>(status: FutureStatus.failure));
        });
  }
}
