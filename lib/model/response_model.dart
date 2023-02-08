import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'response_model.freezed.dart';
part 'response_model.g.dart';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

@freezed
class ResponseModel with _$ResponseModel {
  const factory ResponseModel({
   @JsonKey(name: 'p') String? price,
   @JsonKey(name: 'q') String? quantity,
  }) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
}
