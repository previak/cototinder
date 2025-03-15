import 'package:flutter/material.dart';

class LikesCounter extends StatelessWidget {
  final int likes;

  const LikesCounter({
    super.key,
    required this.likes
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Row(
        children: [
          const Icon(Icons.favorite, color: Colors.red),
          const SizedBox(width: 8),
          Text(
            '$likes',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
