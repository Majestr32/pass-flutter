// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Barcode _$BarcodeFromJson(Map<String, dynamic> json) {
  return Barcode(
    format: json['format'] as String,
    message: json['message'] as String,
    messageEncoding: json['messageEncoding'] as String,
    altText: json['altText'] as String?,
  );
}

Map<String, dynamic> _$BarcodeToJson(Barcode instance) => <String, dynamic>{
      'altText': instance.altText,
      'format': instance.format,
      'message': instance.message,
      'messageEncoding': instance.messageEncoding,
    };
