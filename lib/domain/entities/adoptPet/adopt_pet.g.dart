// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adopt_pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdoptPet _$$_AdoptPetFromJson(Map<String, dynamic> json) => _$_AdoptPet(
      count: json['count'] as int,
      data: (json['entries'] as List<dynamic>)
          .map((e) => AdoptPetData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AdoptPetToJson(_$_AdoptPet instance) =>
    <String, dynamic>{
      'count': instance.count,
      'entries': instance.data,
    };
