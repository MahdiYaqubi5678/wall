import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wall/features/helper/helper_function.dart';
import 'package:wall/features/users/presentation/widgets/my_back_button.dart';
import 'package:wall/features/users/presentation/widgets/user_tile.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            displayMessageToUser("Something went wrong", context);
            return const SizedBox();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No Users Found"));
          }

          final users = snapshot.data!.docs;

          return Column(
            children: [
              /// BACK BUTTON
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 35),
                child: Row(
                  children: const [
                    MyBackButton(),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// USERS LIST
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];

                    return MyUserTile(
                      username: user['username'],
                      email: user['email'],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
