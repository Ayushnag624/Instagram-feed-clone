import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostCarousel extends StatefulWidget {
  final List<String> images;

  const PostCarousel({super.key, required this.images});

  @override
  State<PostCarousel> createState() => _PostCarouselState();
}

class _PostCarouselState extends State<PostCarousel> {
  int index = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        SizedBox(
          height: 350,
          child: PhotoViewGallery.builder(
            pageController: controller,
            itemCount: widget.images.length,
            scrollPhysics: const BouncingScrollPhysics(),

            onPageChanged: (i) {
              setState(() {
                index = i;
              });
            },

            builder: (context, i) {
              return PhotoViewGalleryPageOptions(
                imageProvider:
                CachedNetworkImageProvider(widget.images[i]),

                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 3,

                heroAttributes:
                PhotoViewHeroAttributes(tag: widget.images[i]),
              );
            },
          ),
        ),

        /// DOT INDICATOR
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.images.length,
                  (dot) => Container(
                margin: const EdgeInsets.all(3),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == dot
                      ? Colors.white
                      : Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}