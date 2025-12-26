import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Timestamp timestamp;

  const MyListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.timestamp,
  });

  String _formatDate(Timestamp ts) {
    final d = ts.toDate();
    return "${d.day.toString().padLeft(2, '0')}/"
        "${d.month.toString().padLeft(2, '0')}/"
        "${d.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// POST TITLE
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 6),

          /// EMAIL + DATE
          Text(
            "$subTitle • ${_formatDate(timestamp)}",
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
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
