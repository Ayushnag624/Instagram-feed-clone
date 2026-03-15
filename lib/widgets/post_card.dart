import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';
import '../models/post_model.dart';

class PostCard extends StatefulWidget {

  final Post post;

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {

  final PageController controller = PageController();
  int index = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void toggleLike() {
    setState(() {
      widget.post.isLiked = !widget.post.isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        ListTile(
          leading: CircleAvatar(
            backgroundImage:
            CachedNetworkImageProvider(widget.post.userImage),
          ),
          title: Text(
            widget.post.username,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.more_vert),
        ),


        GestureDetector(
          onDoubleTap: toggleLike,
          child: Stack(
            children: [

              SizedBox(
                height: 350,
                child: PageView.builder(
                  controller: controller,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.post.images.length,

                  onPageChanged: (i) {
                    setState(() => index = i);
                  },

                  itemBuilder: (context, i) {
                    return PhotoView(
                      imageProvider: CachedNetworkImageProvider(
                        widget.post.images[i],
                      ),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 2,
                    );
                  },
                ),
              ),

              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.post.images.length,
                        (dot) => Container(
                      margin: const EdgeInsets.all(3),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == dot ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),


        Row(
          children: [

            IconButton(
              icon: Icon(
                widget.post.isLiked
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: widget.post.isLiked ? Colors.red : Colors.black,
              ),
              onPressed: toggleLike,
            ),

            IconButton(
              icon: const Icon(Icons.chat_bubble_outline),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Comments not implemented"),
                  ),
                );
              },
            ),

            IconButton(
              icon: const Icon(Icons.send_outlined),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Share not implemented"),
                  ),
                );
              },
            ),

            const Spacer(),

            IconButton(
              icon: Icon(
                widget.post.isSaved
                    ? Icons.bookmark
                    : Icons.bookmark_border,
              ),
              onPressed: () {
                setState(() {
                  widget.post.isSaved = !widget.post.isSaved;
                });
              },
            )
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [

                TextSpan(
                  text: widget.post.username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                TextSpan(
                  text: " ${widget.post.caption}",
                )

              ],
            ),
          ),
        ),

        const SizedBox(height: 20)

      ],
    );
  }
}