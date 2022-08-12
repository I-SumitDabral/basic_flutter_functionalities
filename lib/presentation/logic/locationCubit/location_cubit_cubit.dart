import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:raftlabs_assignment/config/constants/static_data.dart';
import 'package:raftlabs_assignment/data/core/enums/app_error.dart';
import 'package:raftlabs_assignment/domain/entities/location/location_model.dart';
import 'package:raftlabs_assignment/domain/entities/no_params.dart';
import 'package:raftlabs_assignment/domain/usecases/clear_localdata_usecase.dart';
import 'package:raftlabs_assignment/domain/usecases/fetch_location_usecase.dart';
import 'package:raftlabs_assignment/presentation/logic/loading/loading_cubit.dart';

part 'location_cubit_state.dart';
part 'location_cubit_cubit.freezed.dart';

@lazySingleton
class LocationCubitCubit extends Cubit<LocationCubitState> {
  final FetchUserLocationUseCase _fetchUserLocationUseCase;
  final ClearLocalDataUseCase _clearLocalDataUseCase;
  final LoadingCubit _loadingCubit;
  LocationCubitCubit(this._fetchUserLocationUseCase,
      this._clearLocalDataUseCase, this._loadingCubit)
      : super(const LocationCubitState.initial());

  Future<void> fetchLocation() async {
    try {
      _loadingCubit.show;
      final eitherResponse = await _fetchUserLocationUseCase.call(NoParams());
      emit(eitherResponse.fold((l) => LocationCubitState.error(l.appErrorType),
          (r) {
        final double distance = StaticData.calculateDistance(r.lat, r.long);
        return LocationCubitState.fetched(distance);
      }));
    } finally {
      _loadingCubit.hide;
    }
  }

  Future<void> clearLocalData() async {
    await _clearLocalDataUseCase.call(NoParams());
  }
}
