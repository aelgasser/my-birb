import 'package:birb/no_content.dart';
import 'package:birb/post_item.dart';
import 'package:flutter/material.dart';

class PostsList extends StatelessWidget {
  const PostsList(this.posts);

  final Stream<List<int>> posts;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<int>>(
      stream: posts,
      builder: _buildFromSnapshot
    );  
  }

  Widget _buildFromSnapshot(BuildContext context, AsyncSnapshot<List<int>> snapshot) {
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

  Text _buildError(AsyncSnapshot<List<int>> snapshot) {
    return Text('Error: ${snapshot.error}');
  }

  Text _buildLoading() {
    return const Text('Loading...');
  }

  ListView _buildList(List<int> items) {
    return ListView(
      children: items.map((int index) => const PostItem()).toList(),
    );
  }
}