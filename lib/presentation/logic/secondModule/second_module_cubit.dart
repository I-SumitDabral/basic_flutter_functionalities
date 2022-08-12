import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:raftlabs_assignment/data/core/enums/app_error.dart';
import 'package:raftlabs_assignment/domain/usecases/fetchadoptdata_usecase.dart';

import '../../../domain/entities/adoptPetData/adopt_pet_data.dart';

part 'second_module_state.dart';
part 'second_module_cubit.freezed.dart';

@lazySingleton
class SecondModuleCubit extends Cubit<SecondModuleState> {
  final FetchAdoptDataUseCase _fetchAdoptDataUseCase;
  SecondModuleCubit(this._fetchAdoptDataUseCase)
      : super(const SecondModuleState.initial());

  List<AdoptPetData> dataList = [];

  Future<void> fetchData() async {
    final response = await _fetchAdoptDataUseCase.call(true);
    emit(response.fold((l) => SecondModuleState.error(l.appErrorType), (r) {
      dataList = r.data;
      return SecondModuleState.fetched(r.data);
    }));
  }

  void searchDescription(String text) {
    emit(const SecondModuleState.initial());
    final data = dataList
        .where((element) => element.description.contains(text))
        .toList();
    emit(SecondModuleState.fetched(data));
  }

  void filterBasedOnCategory(String category) {
    emit(const SecondModuleState.initial());
    final data =
        dataList.where((element) => element.category == category).toList();
    emit(SecondModuleState.fetched(data));
  }
}
