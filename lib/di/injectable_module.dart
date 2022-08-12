import 'package:audio_service/audio_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import "package:http/http.dart" as http;
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:raftlabs_assignment/config/constants/static_data.dart';

import '../presentation/handler/audio_handler.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  http.Client get client => http.Client();

  @lazySingleton
  Connectivity get connectivity => Connectivity();
  @lazySingleton
  Location get location => Location();



}

class InjectableModuleImpl extends InjectableModule {}
