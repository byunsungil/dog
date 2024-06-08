// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cate _$CateFromJson(Map<String, dynamic> json) {
  return _Cate.fromJson(json);
}

/// @nodoc
mixin _$Cate {
  String? get docId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  int? get recruitment => throw _privateConstructorUsedError;
  String? get story => throw _privateConstructorUsedError;
  int? get days => throw _privateConstructorUsedError;
  bool? get isSale => throw _privateConstructorUsedError;
  int? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CateCopyWith<Cate> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CateCopyWith<$Res> {
  factory $CateCopyWith(Cate value, $Res Function(Cate) then) =
      _$CateCopyWithImpl<$Res, Cate>;
  @useResult
  $Res call(
      {String? docId,
      String? title,
      String? location,
      int? recruitment,
      String? story,
      int? days,
      bool? isSale,
      int? timestamp});
}

/// @nodoc
class _$CateCopyWithImpl<$Res, $Val extends Cate>
    implements $CateCopyWith<$Res> {
  _$CateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = freezed,
    Object? title = freezed,
    Object? location = freezed,
    Object? recruitment = freezed,
    Object? story = freezed,
    Object? days = freezed,
    Object? isSale = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      recruitment: freezed == recruitment
          ? _value.recruitment
          : recruitment // ignore: cast_nullable_to_non_nullable
              as int?,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as String?,
      days: freezed == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int?,
      isSale: freezed == isSale
          ? _value.isSale
          : isSale // ignore: cast_nullable_to_non_nullable
              as bool?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CateImplCopyWith<$Res> implements $CateCopyWith<$Res> {
  factory _$$CateImplCopyWith(
          _$CateImpl value, $Res Function(_$CateImpl) then) =
      __$$CateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? docId,
      String? title,
      String? location,
      int? recruitment,
      String? story,
      int? days,
      bool? isSale,
      int? timestamp});
}

/// @nodoc
class __$$CateImplCopyWithImpl<$Res>
    extends _$CateCopyWithImpl<$Res, _$CateImpl>
    implements _$$CateImplCopyWith<$Res> {
  __$$CateImplCopyWithImpl(_$CateImpl _value, $Res Function(_$CateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = freezed,
    Object? title = freezed,
    Object? location = freezed,
    Object? recruitment = freezed,
    Object? story = freezed,
    Object? days = freezed,
    Object? isSale = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$CateImpl(
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      recruitment: freezed == recruitment
          ? _value.recruitment
          : recruitment // ignore: cast_nullable_to_non_nullable
              as int?,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as String?,
      days: freezed == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int?,
      isSale: freezed == isSale
          ? _value.isSale
          : isSale // ignore: cast_nullable_to_non_nullable
              as bool?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CateImpl implements _Cate {
  _$CateImpl(
      {this.docId,
      this.title,
      this.location,
      this.recruitment,
      this.story,
      this.days,
      this.isSale,
      this.timestamp});

  factory _$CateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CateImplFromJson(json);

  @override
  final String? docId;
  @override
  final String? title;
  @override
  final String? location;
  @override
  final int? recruitment;
  @override
  final String? story;
  @override
  final int? days;
  @override
  final bool? isSale;
  @override
  final int? timestamp;

  @override
  String toString() {
    return 'Cate(docId: $docId, title: $title, location: $location, recruitment: $recruitment, story: $story, days: $days, isSale: $isSale, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CateImpl &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.recruitment, recruitment) ||
                other.recruitment == recruitment) &&
            (identical(other.story, story) || other.story == story) &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.isSale, isSale) || other.isSale == isSale) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, docId, title, location,
      recruitment, story, days, isSale, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CateImplCopyWith<_$CateImpl> get copyWith =>
      __$$CateImplCopyWithImpl<_$CateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CateImplToJson(
      this,
    );
  }
}

abstract class _Cate implements Cate {
  factory _Cate(
      {final String? docId,
      final String? title,
      final String? location,
      final int? recruitment,
      final String? story,
      final int? days,
      final bool? isSale,
      final int? timestamp}) = _$CateImpl;

  factory _Cate.fromJson(Map<String, dynamic> json) = _$CateImpl.fromJson;

  @override
  String? get docId;
  @override
  String? get title;
  @override
  String? get location;
  @override
  int? get recruitment;
  @override
  String? get story;
  @override
  int? get days;
  @override
  bool? get isSale;
  @override
  int? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$CateImplCopyWith<_$CateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
