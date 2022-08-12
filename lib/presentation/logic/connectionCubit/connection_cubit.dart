import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:raftlabs_assignment/domain/entities/no_params.dart';

import '../../../domain/usecases/getCurrentConnectionStatus_usecase.dart';

part 'connection_state.dart';
part 'connection_cubit.freezed.dart';

@injectable
class ConnectionCubit extends Cubit<ConnectionState> {
  final GetCurrentNetworkStatusUsecase _getCurrentNetworkStatusUsecase;
  ConnectionCubit(this._getCurrentNetworkStatusUsecase)
      : super(const ConnectionState.initial());

  StreamSubscription? connectionStream;

  void checkonnection() {
    connectionStream =
        _getCurrentNetworkStatusUsecase.call(NoParams()).listen((event) {
      event.fold(
          (l) => emit(const ConnectionState.notConnected()),
          (r) => r.listen((result) {
                if (result == ConnectivityResult.mobile ||
                    result == ConnectivityResult.wifi) {
                   emit(const ConnectionState.connected());
                } else {
                   emit(const ConnectionState.notConnected());
                }
              }));
    });
  
 
  }

  @override
  Future<void> close() {
    connectionStream?.cancel();
    return super.close();
  }
}
