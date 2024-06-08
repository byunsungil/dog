// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CateImpl _$$CateImplFromJson(Map<String, dynamic> json) => _$CateImpl(
      docId: json['docId'] as String?,
      title: json['title'] as String?,
      location: json['location'] as String?,
      recruitment: (json['recruitment'] as num?)?.toInt(),
      story: json['story'] as String?,
      days: (json['days'] as num?)?.toInt(),
      isSale: json['isSale'] as bool?,
      timestamp: (json['timestamp'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CateImplToJson(_$CateImpl instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'title': instance.title,
      'location': instance.location,
      'recruitment': instance.recruitment,
      'story': instance.story,
      'days': instance.days,
      'isSale': instance.isSale,
      'timestamp': instance.timestamp,
    };
