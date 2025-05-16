import 'package:flutter/material.dart';
import 'package:cototinder/data/models/cat_breed.dart';
import 'package:intl/intl.dart';

class CatListTile extends StatelessWidget {
  final CatBreed cat;
  final VoidCallback onDelete;

  const CatListTile({
    super.key,
    required this.cat,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(cat.id),
      background: Container(color: Colors.red),
      onDismissed: (_) => onDelete(),
      child: ListTile(
        leading: Image.network(cat.imageUrl, width: 50, height: 50),
        title: Text(cat.breedName),
        subtitle:
            Text('Liked: ${DateFormat('dd.MM.yyyy').format(cat.likedDate)}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
