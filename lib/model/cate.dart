import 'package:freezed_annotation/freezed_annotation.dart';
part 'cate.freezed.dart';
part 'cate.g.dart';
@freezed
sealed class Cate with _$Cate{
  factory Cate({
    String? docId,
    String? title,
    String? location,
    int? recruitment,
    String? story,
    int? days,
    bool? isSale,
    int? timestamp,
}) = _Cate;
  factory Cate.fromJson(Map<String, dynamic>json) =>
      _$CateFromJson(json);
}

// flutter pub run build_runner build