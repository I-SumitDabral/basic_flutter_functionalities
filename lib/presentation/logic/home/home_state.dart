part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial(int index) = _Initial;
  const factory HomeState.pageChanged(int index) = _PageChanged;
}
