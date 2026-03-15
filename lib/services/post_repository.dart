import 'dart:async';
import '../models/post_model.dart';

class PostRepository {

  Future<List<Post>> fetchPosts(int page) async {

    await Future.delayed(Duration(seconds: 2));

    return List.generate(10, (index) {
      return Post(
        username: "user_$index",
        userImage:
        "https://i.pravatar.cc/150?img=$index",
        images: [
          "https://picsum.photos/500/500?random=${index + page}",
          "https://picsum.photos/500/500?random=${index + page + 1}"
        ],
        caption: "Beautiful day 🌅",
      );
    });
  }
}