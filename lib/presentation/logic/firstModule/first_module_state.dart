part of 'first_module_cubit.dart';

@freezed
class FirstModuleState with _$FirstModuleState {
  const factory FirstModuleState.initial() = _Initial;
  const factory FirstModuleState.fetched(List<AdoptPetData> data) = _Fetched;
  const factory FirstModuleState.scrolled(List<AdoptPetData> data) = _Scrolled;
  const factory FirstModuleState.error(AppErrorType type) = _Error;
}
