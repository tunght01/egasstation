import 'package:egasstation/domain/entities/user_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data_dto.g.dart';

@JsonSerializable()
class UserDataDto extends UserDataModel {
  factory UserDataDto.fromJson(Map<String, dynamic> json) => _$UserDataDtoFromJson(json);

  UserDataDto({required this.accessToken, required this.signalRUrl, required this.userName});

  Map<String, dynamic> toJson() => _$UserDataDtoToJson(this);

  @JsonKey(name: 'accessToken')
  @override
  final String accessToken;

  @JsonKey(name: 'signalRUrl')
  @override
  final String signalRUrl;

  @JsonKey(name: 'username')
  @override
  final String userName;
}
