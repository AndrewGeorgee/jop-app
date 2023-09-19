// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'responce.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'statuse')
  int? statuse;
  @JsonKey(name: 'message')
  String? message;
}

@JsonSerializable()
class CustomerResponce {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'nameOfNotification')
  int? nameOfNotification;
  CustomerResponce(this.id, this.name, this.nameOfNotification);
  factory CustomerResponce.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponceFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerResponceToJson(this);
}

@JsonSerializable()
class ContactResponce {
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'link')
  String? link;
  ContactResponce(this.email, this.link, this.phone);
  factory ContactResponce.fromJson(Map<String, dynamic> json) =>
      _$ContactResponceFromJson(json);
  Map<String, dynamic> toJson() => _$ContactResponceToJson(this);
}

@JsonSerializable()
class AuthenticationResponce extends BaseResponse {
  @JsonKey(name: 'customer')
  CustomerResponce? customer;
  @JsonKey(name: 'contact')
  ContactResponce? contact;
  AuthenticationResponce(this.contact, this.customer);
  factory AuthenticationResponce.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponceFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticationResponceToJson(this);
}

@JsonSerializable()
class ForgetPasswordResponce extends BaseResponse {
  @JsonKey(name: 'support')
  String? support;
  ForgetPasswordResponce(this.support);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponceToJson(this);

  factory ForgetPasswordResponce.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponceFromJson(json);
}

@JsonSerializable()
class ForgetPasswordByPhoneResponce extends BaseResponse {
  @JsonKey(name: 'phone')
  String? phone;
  ForgetPasswordByPhoneResponce(this.phone);

  Map<String, dynamic> toJson() => _$ForgetPasswordByPhoneResponceToJson(this);

  factory ForgetPasswordByPhoneResponce.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordByPhoneResponceFromJson(json);
}
