import 'package:flutter/material.dart';
import 'package:flutter_state_management/story.dart';
import 'package:flutter_state_management/story_details_body.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final story = Story(
        id: 1,
        title: 'chapter1',
        summary: 'テストストーリーです',
        thumbnailImagePath: 'assets/story/1/hokuma.jpg',
        isRead: false);

    final windowWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('物語の詳細'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: windowWidth > 800
              ? EdgeInsets.symmetric(horizontal: 140)
              : EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Center(
                child: StoryDetailsBody(story: story),
              ),
              GestureDetector(
                onTap: () {
                  launch('https://github.com/tetsufe/state_notifier_sample6/');
                },
                child: Text(
                  'GitHubリポジトリはこちら',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}