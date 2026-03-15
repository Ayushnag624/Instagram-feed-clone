import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostCaption extends StatelessWidget {

  final String username;
  final String caption;

  PostCaption({required this.username,required this.caption});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal:12),

      child: RichText(
        text: TextSpan(
          style: TextStyle(color:Colors.black),
          children: [

            TextSpan(
                text: username,
                style: TextStyle(fontWeight:FontWeight.bold)
            ),

            TextSpan(
                text: " $caption"
            )

          ],
        ),
      ),
    );
  }
}