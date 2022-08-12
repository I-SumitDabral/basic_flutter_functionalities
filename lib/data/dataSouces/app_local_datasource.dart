import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:raftlabs_assignment/domain/entities/adoptPet/adopt_pet.dart';

abstract class AppLocalDataSource {
  Future<AdoptPet?> getData();
  Future<void> setUpData(AdoptPet data);
  Future<void> clearData();
}

@LazySingleton(as: AppLocalDataSource)
class AppLocalDataSourceImpl extends AppLocalDataSource {
  @override
  Future<AdoptPet?> getData() async {
    final dataBox = await Hive.openBox<String>('appSetup');
    final response = dataBox.get('dataList');

    if (response != null) {
      final parsed = json.decode(response);
      return AdoptPet.fromJson(parsed);
    }
    return null;
  }

  @override
  Future<void> setUpData(AdoptPet data) async {
    final onBoardingBox = await Hive.openBox<String>('appSetup');
    return onBoardingBox.put('dataList', json.encode(data));
  }

  @override
  Future<void> clearData() async {
    final onBoardingBox = await Hive.openBox<String>('appSetup');
    onBoardingBox.clear();
  }
}
