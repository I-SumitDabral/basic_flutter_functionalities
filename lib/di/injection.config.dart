// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i8;

import '../data/core/client/api_client.dart' as _i10;
import '../data/core/client/connection_client.dart' as _i12;
import '../data/core/client/location_client.dart' as _i9;
import '../data/dataSouces/app_local_datasource.dart' as _i3;
import '../data/dataSouces/app_remote_datasource.dart' as _i11;
import '../data/dataSouces/app_setup_datasource.dart' as _i15;
import '../data/repositories/animal_repository_impl.dart' as _i14;
import '../data/repositories/app_setup_respository_impl.dart' as _i17;
import '../domain/repositories/animal_repository.dart' as _i13;
import '../domain/repositories/app_setup_repository.dart' as _i16;
import '../domain/usecases/clear_localdata_usecase.dart' as _i18;
import '../domain/usecases/fetch_location_usecase.dart' as _i20;
import '../domain/usecases/fetchadoptdata_usecase.dart' as _i19;
import '../domain/usecases/getCurrentConnectionStatus_usecase.dart' as _i21;
import '../presentation/logic/connectionCubit/connection_cubit.dart' as _i24;
import '../presentation/logic/firstModule/first_module_cubit.dart' as _i25;
import '../presentation/logic/home/home_cubit.dart' as _i6;
import '../presentation/logic/loading/loading_cubit.dart' as _i7;
import '../presentation/logic/locationCubit/location_cubit_cubit.dart' as _i22;
import '../presentation/logic/secondModule/second_module_cubit.dart' as _i23;
import 'injectable_module.dart' as _i26; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.AppLocalDataSource>(() => _i3.AppLocalDataSourceImpl());
  gh.lazySingleton<_i4.Client>(() => injectableModule.client);
  gh.lazySingleton<_i5.Connectivity>(() => injectableModule.connectivity);
  gh.lazySingleton<_i6.HomeCubit>(() => _i6.HomeCubit());
  gh.lazySingleton<_i7.LoadingCubit>(() => _i7.LoadingCubit());
  gh.lazySingleton<_i8.Location>(() => injectableModule.location);
  gh.lazySingleton<_i9.LocationClient>(
      () => _i9.LocationClient(get<_i8.Location>()));
  gh.lazySingleton<_i10.ApiClient>(() => _i10.ApiClient(get<_i4.Client>()));
  gh.lazySingleton<_i11.AppRemoteDataSouce>(
      () => _i11.AppRemoteDataSouceImpl(get<_i10.ApiClient>()));
  gh.lazySingleton<_i12.ConnectionClient>(
      () => _i12.ConnectionClient(get<_i5.Connectivity>()));
  gh.lazySingleton<_i13.AnimalRepository>(() => _i14.AnimalRepositoryImpl(
      get<_i11.AppRemoteDataSouce>(), get<_i3.AppLocalDataSource>()));
  gh.lazySingleton<_i15.AppSetupDataSouce>(() => _i15.AppSetupDatSouceImpl(
      get<_i12.ConnectionClient>(), get<_i9.LocationClient>()));
  gh.lazySingleton<_i16.AppSetupRepository>(
      () => _i17.AppSetupRepositoryImpl(get<_i15.AppSetupDataSouce>()));
  gh.lazySingleton<_i18.ClearLocalDataUseCase>(
      () => _i18.ClearLocalDataUseCase(get<_i13.AnimalRepository>()));
  gh.lazySingleton<_i19.FetchAdoptDataUseCase>(
      () => _i19.FetchAdoptDataUseCase(get<_i13.AnimalRepository>()));
  gh.lazySingleton<_i20.FetchUserLocationUseCase>(
      () => _i20.FetchUserLocationUseCase(get<_i16.AppSetupRepository>()));
  gh.lazySingleton<_i21.GetCurrentNetworkStatusUsecase>(() =>
      _i21.GetCurrentNetworkStatusUsecase(get<_i16.AppSetupRepository>()));
  gh.lazySingleton<_i22.LocationCubitCubit>(() => _i22.LocationCubitCubit(
      get<_i20.FetchUserLocationUseCase>(),
      get<_i18.ClearLocalDataUseCase>(),
      get<_i7.LoadingCubit>()));
  gh.lazySingleton<_i23.SecondModuleCubit>(
      () => _i23.SecondModuleCubit(get<_i19.FetchAdoptDataUseCase>()));
  gh.factory<_i24.ConnectionCubit>(
      () => _i24.ConnectionCubit(get<_i21.GetCurrentNetworkStatusUsecase>()));
  gh.factory<_i25.FirstModuleCubit>(() => _i25.FirstModuleCubit(
      get<_i19.FetchAdoptDataUseCase>(),
      get<_i7.LoadingCubit>(),
      get<_i23.SecondModuleCubit>()));
  return get;
}

class _$InjectableModule extends _i26.InjectableModule {}
