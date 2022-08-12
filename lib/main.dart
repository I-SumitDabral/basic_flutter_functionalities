import 'dart:async';
import 'presentation/handler/audio_handler.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raftlabs_assignment/app_widget.dart';
import 'package:raftlabs_assignment/data/core/tables/adopted_data_table.dart';
import 'package:raftlabs_assignment/data/core/tables/adopted_pet_table.dart';
import 'package:raftlabs_assignment/di/injection.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();
  Hive.registerAdapter(AdoptedDataListAdapter());
  Hive.registerAdapter(AdoptedPetDataAdapter());
  unawaited(
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  runApp(const AppWidget());
}
