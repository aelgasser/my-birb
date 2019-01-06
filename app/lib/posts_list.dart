import 'package:flutter/material.dart';

class PostsList extends StatelessWidget {
  const PostsList();

  static const List<int> _items = <int>[0,1,2];

  @override
  Widget build(BuildContext context) {
    return ListView(children: _items.map((int index) => _buildBirdCard(context, index)).toList());
  }

  Card _buildBirdCard(BuildContext context, int index) {
    return Card(
        child: Container(
          height: 300.0,
          child: const Center(
            child: Text('Prim Birb'),
          )
        ),
      );
  }
}