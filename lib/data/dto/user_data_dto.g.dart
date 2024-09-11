// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataDto _$UserDataDtoFromJson(Map<String, dynamic> json) => UserDataDto(
      accessToken: json['accessToken'] as String,
      signalRUrl: json['signalRUrl'] as String,
      userName: json['username'] as String,
    );

Map<String, dynamic> _$UserDataDtoToJson(UserDataDto instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'signalRUrl': instance.signalRUrl,
      'username': instance.userName,
    };
