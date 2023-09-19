// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..statuse = json['statuse'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'statuse': instance.statuse,
      'message': instance.message,
    };

CustomerResponce _$CustomerResponceFromJson(Map<String, dynamic> json) =>
    CustomerResponce(
      json['id'] as String?,
      json['name'] as String?,
      json['nameOfNotification'] as int?,
    );

Map<String, dynamic> _$CustomerResponceToJson(CustomerResponce instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameOfNotification': instance.nameOfNotification,
    };

ContactResponce _$ContactResponceFromJson(Map<String, dynamic> json) =>
    ContactResponce(
      json['email'] as String?,
      json['link'] as String?,
      json['phone'] as String?,
    );

Map<String, dynamic> _$ContactResponceToJson(ContactResponce instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'link': instance.link,
    };

AuthenticationResponce _$AuthenticationResponceFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponce(
      json['contact'] == null
          ? null
          : ContactResponce.fromJson(json['contact'] as Map<String, dynamic>),
      json['customer'] == null
          ? null
          : CustomerResponce.fromJson(json['customer'] as Map<String, dynamic>),
    )
      ..statuse = json['statuse'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResponceToJson(
        AuthenticationResponce instance) =>
    <String, dynamic>{
      'statuse': instance.statuse,
      'message': instance.message,
      'customer': instance.customer,
      'contact': instance.contact,
    };

ForgetPasswordResponce _$ForgetPasswordResponceFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordResponce(
      json['support'] as String?,
    )
      ..statuse = json['statuse'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ForgetPasswordResponceToJson(
        ForgetPasswordResponce instance) =>
    <String, dynamic>{
      'statuse': instance.statuse,
      'message': instance.message,
      'support': instance.support,
    };

ForgetPasswordByPhoneResponce _$ForgetPasswordByPhoneResponceFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordByPhoneResponce(
      json['phone'] as String?,
    )
      ..statuse = json['statuse'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ForgetPasswordByPhoneResponceToJson(
        ForgetPasswordByPhoneResponce instance) =>
    <String, dynamic>{
      'statuse': instance.statuse,
      'message': instance.message,
      'phone': instance.phone,
    };
