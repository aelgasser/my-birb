import 'package:birb/mocks/post_mock.dart';
import 'package:birb/models/post.dart';
import 'package:test/test.dart';

void main() {
  group('Post Mock', () {
    test('Generates valid data', () async {
      final Map<String, dynamic> data = mockPostData();
      
      expect(data.containsKey('id'), true);
      
      final RegExp regex = RegExp('^[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}\$',caseSensitive: false);
      expect(regex.hasMatch(data['id']), true);

      expect(data.containsKey('username'), true);
      expect(data['username'].toString().isNotEmpty, true);

      expect(data.containsKey('imageUrl'), true);
      expect(data['imageUrl'].toString().isNotEmpty, true);

      expect(data.containsKey('createdAt'), true);
      expect(DateTime.tryParse(data['createdAt']), isNotNull);

      expect(data.containsKey('text'), true);
    });

    test('Generates valid Posts', () async {
      final Post post = mockPost(index: 0);
      
      final RegExp regex = RegExp('^[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}\$',caseSensitive: false);
      expect(regex.hasMatch(post.id), true);

      expect(post.username, isNotEmpty);
      expect(post.imageUrl, isNotEmpty);
      expect(post.createdAt, isNotNull);
    });

    test('Generates a list of Posts', () async {
      final Stream<List<Post>> postsStream = mockPosts(count: 3);
      expect(postsStream, isNotNull);      
      final List<Post> posts = await postsStream.single;

      expect(posts, isNotNull);
      expect(posts.length, 3);
    });

  });
}

