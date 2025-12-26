import 'package:flutter/material.dart';

class MyUserTile extends StatelessWidget {
  final String username;
  final String email;

  const MyUserTile({
    super.key,
    required this.username,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// USERNAME
          Text(
            username,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 6),

          /// EMAIL
          Text(
            email,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          const SizedBox(height: 14),

          /// DIVIDER
          Divider(
            height: 1,
            thickness: 0.5,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
