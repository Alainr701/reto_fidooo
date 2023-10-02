// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntity _$$_UserEntityFromJson(Map<String, dynamic> json) =>
    _$_UserEntity(
      name: json['name'] as String?,
      age: json['age'] as int?,
      state: json['state'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$$_UserEntityToJson(_$_UserEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'state': instance.state,
      'date': instance.date?.toIso8601String(),
      'gender': instance.gender,
    };
