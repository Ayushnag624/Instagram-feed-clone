import 'package:flutter/material.dart';

class PostActions extends StatefulWidget {

  @override
  State<PostActions> createState() => _PostActionsState();
}

class _PostActionsState extends State<PostActions> {

  bool liked = false;
  bool saved = false;

  @override
  Widget build(BuildContext context) {

    return Row(

      children: [

        IconButton(
          icon: Icon(
            liked
                ? Icons.favorite
                : Icons.favorite_border,
            color: liked ? Colors.red : Colors.black,
          ),
          onPressed: (){
            setState(() {
              liked = !liked;
            });
          },
        ),

        IconButton(
          icon: Icon(Icons.chat_bubble_outline),
          onPressed: (){
            ScaffoldMessenger.of(context)
                .showSnackBar(
              SnackBar(
                content: Text("Comments coming soon"),
              ),
            );
          },
        ),

        IconButton(
          icon: Icon(Icons.send_outlined),
          onPressed: (){},
        ),

        Spacer(),

        IconButton(
          icon: Icon(
              saved
                  ? Icons.bookmark
                  : Icons.bookmark_border
          ),
          onPressed: (){
            setState(() {
              saved = !saved;
            });
          },
        )

      ],
    );
  }
}