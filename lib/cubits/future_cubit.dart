import 'package:flutter_bloc/flutter_bloc.dart';

enum FutureStatus { pending, loading, success, failure }

class FutureState<DataType> {
  DataType? data;
  FutureStatus status = FutureStatus.pending;

  FutureState({this.data, this.status = FutureStatus.pending});

  FutureState<DataType> copyWith({DataType? data, FutureStatus? status}) {
    return FutureState<DataType>(
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }
}

class FutureCubit<DataType> extends Cubit<FutureState<DataType>> {
  FutureCubit() : super(FutureState<DataType>());

  void fetch(Future<DataType> Function() queryFn) async {
    emit(state.copyWith(status: FutureStatus.loading, data: null));
    try {
      final value = await queryFn();
      emit(state.copyWith(status: FutureStatus.success, data: value));
    } catch (_) {
      emit(state.copyWith(status: FutureStatus.failure, data: null));
    }
  }
}
