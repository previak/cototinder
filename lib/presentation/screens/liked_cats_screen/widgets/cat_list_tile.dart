import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        leading: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 50, maxHeight: 50),
          child: CachedNetworkImage(
            imageUrl: cat.imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.grey[300],
              child: const Icon(Icons.pets),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
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
