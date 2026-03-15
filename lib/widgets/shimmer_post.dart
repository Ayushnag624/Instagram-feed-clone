import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPost extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
            ),
            title: Container(
              height: 10,
              width: 100,
              color: Colors.white,
            ),
          ),

          Container(
            height: 350,
            width: double.infinity,
            color: Colors.white,
          ),

          SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 10,
              width: 200,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}