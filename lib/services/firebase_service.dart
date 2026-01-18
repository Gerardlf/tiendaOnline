import 'package:app_navegacion_estado/data/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Inicio de sesión de forma anónima
  Future<User> signInAnonymously() async {
    final credential = await _auth.signInAnonymously();
    return credential.user!;
  }

  //devolver el usuario actual
  User? get currentUser => _auth.currentUser;

  //Guardar un favorito en Firestore
  Future<void> addFavorite(Product product) async {
    final user = currentUser;
    if (user == null) {
      throw Exception("Usuario no autenticado");
    }
    await _firestore
        .collection("users")
        .doc(user.uid)
        .collection("favorites")
        .add({
          " ProductId": product.id,
          "title": product.id,
          "price": product.price,
          "category": product.category,
          "imageUrl": product.imageUrl,
          "createdAt": FieldValue.serverTimestamp(),
        });
  }

  //leer favoritos del usuario desde Firestore
  Stream<List<Map<String, dynamic>>> favoritesStream() {
    final user = currentUser;
    if (user == null) {
      return const Stream.empty();
    }

    return _firestore
        .collection("users")
        .doc(user.uid)
        .collection("favorites")
        .orderBy("createdAt", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  //Eliminar un favorito por su ID de documento
  Future<void> removeFavorite(String docId) async {
    final user = currentUser;
    if (user == null) {
      throw Exception("Usuario no autenticado");
    }
    await _firestore
        .collection("users")
        .doc(user.uid)
        .collection("favorites")
        .doc(docId)
        .delete();
  }
}
