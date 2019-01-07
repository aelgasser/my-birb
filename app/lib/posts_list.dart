import 'package:birb/models/post.dart';
import 'package:birb/no_content.dart';
import 'package:birb/post_item.dart';
import 'package:flutter/material.dart';

class PostsList extends StatelessWidget {
  const PostsList(this.posts);

  final Stream<List<Post>> posts;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
      stream: posts,
      builder: _buildFromSnapshot
    );  
  }

  Widget _buildFromSnapshot(BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
      if( snapshot.hasError ) {
        return _buildError(snapshot);
      }
  
      if( snapshot.connectionState == ConnectionState.waiting) {
        return _buildLoading();
      } 
  
      if( snapshot.data.isEmpty ) {
        return const NoContent();
      }
  
      return _buildList(snapshot.data);
  }

  Text _buildError(AsyncSnapshot<List<Post>> snapshot) {
    return Text('Error: ${snapshot.error}');
  }

  Text _buildLoading() {
    return const Text('Loading...');
  }

  ListView _buildList(List<Post> items) {
    return ListView(
      children: items.map((Post post) => Container(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
        child: PostItem(post),
      )).toList()
    );
  }
}