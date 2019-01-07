import 'package:birb/mocks/post_mock.dart';
import 'package:birb/models/post.dart';
import 'package:birb/no_content.dart';
import 'package:birb/post_item.dart';
import 'package:birb/posts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';


void main() {
  group('PostList', () {
    testWidgets('Shows loading message', (WidgetTester tester) async {
      provideMockedNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(
          home: PostsList(mockPosts(count: 1)),
        ));

        expect(find.text('Loading...'), findsOneWidget);
        await tester.pump(Duration.zero);
        expect(find.text('Loading...'), findsNothing);      
      });
    });  
    testWidgets('Renders list of posts', (WidgetTester tester) async {
      provideMockedNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(
          home: PostsList(mockPosts(count: 5)),
        ));

        await tester.pump(Duration.zero);
        
        // 5 widgets should be displayed on screen at a time. 
        // The test only 'sees' what the user sees
        expect(find.byType(PostItem), findsNWidgets(5));
      });
    });  

    testWidgets('Handles empty list with specific UI', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: PostsList(mockPosts(count: 0)),
      ));
      
      await tester.pump(Duration.zero);
      
      expect(find.byType(NoContent), findsOneWidget);
    });  

    testWidgets('Handles errors', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: PostsList(_streamWithError('Bad Connection')),
      ));
      
      await tester.pump(Duration.zero);
      
      expect(find.text('Error: Bad Connection'), findsOneWidget);
    }); 
  });
}

Stream<List<Post>> _streamWithError(String error) {
  return Future<List<Post>>.error(error).asStream();
}

