import 'package:app_navegacion_estado/services/firebase_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firebase = FirebaseService();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mis Favoritos",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigoAccent,
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: firebase.favoritesStream(),
        builder: (context, snapshot) {
          //cargando datos
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          //error al cargar datos
          if (snapshot.hasError) {
            return Center(
              child: Text("Error al cargar favoritos: ${snapshot.error}"),
            );
          }

          //datos cargados
          final favorites = snapshot.data ?? [];

          //datos vacíos

          if (favorites.isEmpty) {
            return const Center(child: Text("No tienes favoritos aún."));
          }

          //mostrar lista de favoritos

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final favorite = favorites[index];

              final title = favorite["title"] ?? "Sin título";
              final category = favorite["category"] ?? "Sin categoría";
              final price = favorite["price"] ?? 0;
              final imageUrl = favorite["imageUrl"];

              return ListTile(
                leading: (imageUrl != null)
                    ? Image.network(
                        imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.image_not_supported),
                title: Text(title),
                subtitle: Text("${(price ?? 0).toString()} €  · $category"),
              );
            },
          );
        },
      ),
    );
  }
}
