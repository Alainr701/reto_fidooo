import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';
part "post_entity.g.dart";

@freezed
@JsonSerializable()
abstract class PostEntity with _$PostEntity {
  const factory PostEntity({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _PostEntity;

  factory PostEntity.fromJson(Map<String, dynamic> json) =>
      _$PostEntityFromJson(json);
}
