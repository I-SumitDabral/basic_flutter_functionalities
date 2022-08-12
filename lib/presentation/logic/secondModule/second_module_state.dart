part of 'second_module_cubit.dart';

@freezed
class SecondModuleState with _$SecondModuleState {
  const factory SecondModuleState.initial() = _Initial;
  const factory SecondModuleState.fetched(List<AdoptPetData> data) = _Fetched;
  const factory SecondModuleState.error(AppErrorType error) = _Error;
}
