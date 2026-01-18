import 'dart:ffi';

import 'package:flutter/material.dart';

class ProductCardApi extends StatelessWidget {
  final int id;
  final String title;
  final double price;
  final String category;
  final String imageUrl;

  final VoidCallback onAdd;
  final VoidCallback? onFavorite;

  const ProductCardApi({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.onAdd,
    this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blueAccent,
      elevation: 12,
      child: ListTile(
        leading: Image.network(
          imageUrl,
          width: 53,
          height: 53,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => const Icon(
            Icons.image_not_supported,
            size: 40,
            color: Colors.indigo,
          ),
        ),
        title: Text(
          title,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          "$category\n${price.toStringAsFixed(2)} €",
          style: TextStyle(color: Colors.blueGrey[700], fontSize: 14),
        ),
        trailing: Row(
          children: [
            IconButton(
              tooltip: "Favorito",
              onPressed: onFavorite,
              icon: Icon(Icons.star_border, color: Colors.amberAccent),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              onPressed: onAdd,
              child: const Text(
                "Añadir",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
