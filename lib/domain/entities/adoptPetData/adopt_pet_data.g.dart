// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adopt_pet_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdoptPetData _$$_AdoptPetDataFromJson(Map<String, dynamic> json) =>
    _$_AdoptPetData(
      api: json['API'] as String,
      description: json['Description'] as String,
      auth: json['Auth'] as String,
      hTTPS: json['HTTPS'] as bool,
      cors: json['Cors'] as String,
      link: json['Link'] as String,
      category: json['Category'] as String,
    );

Map<String, dynamic> _$$_AdoptPetDataToJson(_$_AdoptPetData instance) =>
    <String, dynamic>{
      'API': instance.api,
      'Description': instance.description,
      'Auth': instance.auth,
      'HTTPS': instance.hTTPS,
      'Cors': instance.cors,
      'Link': instance.link,
      'Category': instance.category,
    };
