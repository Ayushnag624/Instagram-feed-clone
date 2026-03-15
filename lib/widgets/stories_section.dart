import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoriesSection extends StatelessWidget {

  final List<String> images = List.generate(
      10,
          (i) => "https://i.pravatar.cc/150?img=$i");

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context,index){

          return Padding(
            padding: EdgeInsets.symmetric(horizontal:8),
            child: Column(
              children: [

                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors:[
                            Colors.orange,
                            Colors.pink
                          ]
                      )
                  ),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundImage:
                    NetworkImage(images[index]),
                  ),
                ),

                SizedBox(height:5),

                Text(
                  "user$index",
                  style: TextStyle(fontSize:12),
                )

              ],
            ),
          );
        },
      ),
    );
  }
}