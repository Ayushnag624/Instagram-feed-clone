import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {

  final String username;
  final String image;

  PostHeader({required this.username,required this.image});

  @override
  Widget build(BuildContext context) {

    return ListTile(

      leading: CircleAvatar(
        backgroundImage: NetworkImage(image),
      ),

      title: Text(
        username,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),

      trailing: Icon(Icons.more_vert),

    );
  }
}