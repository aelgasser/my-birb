import 'package:birb/mocks/post_mock.dart';
import 'package:birb/models/post.dart';
import 'package:birb/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {
  testWidgets('Renders a post', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      final Post post = mockPost(index: 0);
      
      await tester.pumpWidget(MaterialApp(
        home: PostItem(post),
      ));

      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.text(post.username), findsOneWidget);
      expect(find.text(post.text), findsOneWidget);
    });
  });  
}