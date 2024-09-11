import 'package:json_annotation/json_annotation.dart';

part 'base_respone.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<D> {
  final String code;
  final String message;
  D? data;

  BaseResponse(
    this.code,
    this.message,
  );

  factory BaseResponse.fromJson(Map<String, dynamic> json, D Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);
}
