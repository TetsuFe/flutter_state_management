// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
// import 'package:flutter_state_management/story_details_page.dart';
import 'package:flutter_state_management/story_details_body.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_state_management/story_state_notifier.dart';
import 'package:flutter_state_management/story.dart';

// class MockNavigationObserver extends Mock implements Navigator{};

void main() {
  testWidgets('marks as read a story when open novel game page',
      (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        StateNotifierProvider<StoryStateNotifier, Story>(
          child: MaterialApp(home: Scaffold(body: StoryDetailsBody())),
          create: (_) => StoryStateNotifier(
            Story(
                id: 1,
                isRead: false,
                thumbnailImagePath: '../assets/story/1/hokuma.jpg',
                title: '',
                summary: ''),
          ),
        ),
      );

      expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, false);
      expect(find.text('未読'), findsOneWidget);

      await tester.tap(find.byType(FlatButton));
      await tester.pumpAndSettle();

      await tester.pageBack();
      await tester.pumpAndSettle();

      expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, true);
      expect(find.text('既読'), findsOneWidget);
    });
  });
}
