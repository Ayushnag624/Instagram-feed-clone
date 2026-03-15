import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/feed_provider.dart';
import '../widgets/post_card.dart';
import '../widgets/shimmer_post.dart';
import '../widgets/stories_section.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

    final provider =
    Provider.of<PostProvider>(context, listen: false);

    provider.loadPosts();

    controller.addListener(() {

      if (controller.position.pixels >
          controller.position.maxScrollExtent - 300 &&
          !provider.isLoading) {

        provider.loadPosts();

      }

    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),

        title: Text("Instagram"),



        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(width: 16),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.send_outlined),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "",
          ),

        ],
      ),
      body: Consumer<PostProvider>(
        builder: (context, provider, child) {

          /// FIRST LOADING
          if (provider.posts.isEmpty && provider.isLoading) {
            return ListView.builder(
              itemCount: 5,
              itemBuilder: (_, __) =>  ShimmerPost(),
            );
          }

          return ListView.builder(

            controller: controller,

            itemCount: provider.posts.length + 1,

            itemBuilder: (context, index) {

              /// STORIES SECTION
              if (index == 0) {
                return  StoriesSection();
              }

              /// POSTS
              if (index <= provider.posts.length) {

                return PostCard(
                  post: provider.posts[index - 1],
                );

              }

              /// PAGINATION LOADER
              return provider.isLoading
                  ?  ShimmerPost()
                  : const SizedBox();

            },

          );
        },
      ),
    );
  }
}