import 'package:flutter_state_management/sentence/sentence.dart';
import 'package:flutter_state_management/sentence/sentence_state.dart';
import 'package:flutter_state_management/story/story_api.dart';
import 'package:meta/meta.dart';
import 'package:state_notifier/state_notifier.dart';

class SentenceStateNotifier extends StateNotifier<SentenceState>
    with LocatorMixin {
  SentenceStateNotifier({@required this.storyId})
      : super(SentenceState(sentenceIndex: 0, sentenceList: [
          Sentence(
              storyId: 1, characterName: '', body: '', characterImagePath: '')
        ]));

  final int storyId;

  @override
  Future<void> initState() async {
    try {
      final sentenceList =
          await StoryApi().getStorySentenceList(storyId.toString());
      state = state.copyWith(sentenceList: sentenceList);
    } on Exception {
      state = state.copyWith(sentenceList: [
        Sentence(
            storyId: 1,
            characterName: 'ホクマ',
            body: 'state_notifierとfreezedを使ったサンプルを書いたクマ！',
            characterImagePath: 'assets/character_images/neutral_hokuma.png'),
        Sentence(
            storyId: 1,
            characterName: 'ホクマ',
            body: 'なぜかバグで動かないクマ・・',
            characterImagePath: 'assets/character_images/neutral_hokuma.png'),
        Sentence(
            storyId: 1,
            characterName: 'ホクマ',
            body: '近日中にアップデートするクマ！',
            characterImagePath: 'assets/character_images/ypose_hokuma.png')
      ]);
    }
  }

  void goToNextSentence() {
    if (!state.isLastSentence) {
      state = state.copyWith(sentenceIndex: state.sentenceIndex + 1);
    }
  }
}
