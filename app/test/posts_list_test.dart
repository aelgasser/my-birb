import 'package:birb/post_item.dart';
import 'package:birb/posts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Renders list of posts', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: PostsList(),
    ));

    // Two widgtes should be displayed on screen at a time. 
    // The test only 'sees' what the user sees
    expect(find.byType(PostItem), findsNWidgets(2));
  });  
}