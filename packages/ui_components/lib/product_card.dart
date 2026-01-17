import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatelessWidget {
  final String id;
  final String name;
  final double precio;
  final IconData icon;
  final VoidCallback onAdd;

  const ProductCard({
    super.key,
    required this.id,
    required this.name,
    required this.precio,
    required this.icon,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blueAccent,
      elevation: 12,
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Id: $id",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Icon(icon, size: 40, color: Colors.indigo),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
        subtitle: Text(
          "${precio.toStringAsFixed(2)} €",
          style: TextStyle(
            fontSize: 16,
            color: Colors.indigoAccent,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          onPressed: onAdd,
          child: const Text("Añadir", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
