import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wall/database/firestore.dart';
import 'package:wall/features/auth/presentation/widgets/my_textfeild.dart';
import 'package:wall/features/dashboard/presentation/widgets/my_drawer.dart';
import 'package:wall/features/dashboard/presentation/widgets/my_list_tile.dart';
import 'package:wall/features/dashboard/presentation/widgets/my_post_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreDatabse databse = FirestoreDatabse();
  final TextEditingController newPostController = TextEditingController();

  void postMessage() {
    if (newPostController.text.trim().isNotEmpty) {
      databse.addPost(newPostController.text.trim());
      newPostController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const MyDrawer(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("W A L L"),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          /// INPUT AREA
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: MyTextfeild(
                    hintText: "Say something..",
                    obscureText: false,
                    controller: newPostController,
                  ),
                ),
                const SizedBox(width: 10),
                MyPostButton(onTap: postMessage),
              ],
            ),
          ),

          /// POSTS
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: databse.getPostsStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text("No posts yet"),
                  );
                }

                final posts = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return MyListTile(
                      title: post['PostMessage'],
                      subTitle: post['UserEmail'],
                      timestamp: post['TimeStamp'],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
