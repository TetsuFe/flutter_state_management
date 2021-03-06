import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sentence.freezed.dart';
part 'sentence.g.dart';

@freezed
abstract class Sentence with _$Sentence {
  factory Sentence({
    @required int storyId,
    @required String characterName,
    @required String body,
    @required String characterImagePath,
  }) = _Sentence;

  factory Sentence.fromJson(Map<String, dynamic> json) =>
      _$SentenceFromJson(json);
}
