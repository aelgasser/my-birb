import 'package:birb/models/post.dart';
import 'package:birb/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Renders a post', (WidgetTester tester) async {
    final Post post = Post(
      id: '123', 
      createdAt: DateTime.parse('2019-01-06T20:59:00Z'),
      imageUrl: 'no image',
      text: '',
      username: 'bob'
    );
    
    await tester.pumpWidget(MaterialApp(
      home: PostItem(post),
    ));

    expect(find.byType(Card), findsOneWidget);
    expect(find.text(post.username), findsOneWidget);
  });  
}