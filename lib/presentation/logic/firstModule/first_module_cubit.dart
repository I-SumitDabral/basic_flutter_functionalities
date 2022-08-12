import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:raftlabs_assignment/data/core/enums/app_error.dart';
import 'package:raftlabs_assignment/domain/entities/adoptPetData/adopt_pet_data.dart';
import 'package:raftlabs_assignment/domain/usecases/fetchadoptdata_usecase.dart';
import 'package:raftlabs_assignment/presentation/logic/loading/loading_cubit.dart';
import 'package:raftlabs_assignment/presentation/logic/secondModule/second_module_cubit.dart';

part 'first_module_state.dart';
part 'first_module_cubit.freezed.dart';

@injectable
class FirstModuleCubit extends Cubit<FirstModuleState> {
  final FetchAdoptDataUseCase _fetchAdoptDataUseCase;
  final SecondModuleCubit _secondModuleCubit;
  final LoadingCubit _loadingCubit;

  FirstModuleCubit(
      this._fetchAdoptDataUseCase, this._loadingCubit, this._secondModuleCubit)
      : super(const FirstModuleState.initial());
  List<AdoptPetData> dataList = [];
  int currentIndex = 0;
  Future<void> fetchData() async {
    try {
      _loadingCubit.show;
      final response = await _fetchAdoptDataUseCase.call(false);
      _secondModuleCubit.fetchData();
      emit(response.fold((l) => FirstModuleState.error(l.appErrorType), (r) {
        dataList = r.data;
        currentIndex = 20;
        final Set<String> categoryList = Set();

        final data = dataList.take(20).toList();
        return FirstModuleState.fetched(data);
      }));
    } finally {
      _loadingCubit.hide;
    }
  }
}
