import 'package:app_navegacion_estado/data/cart_repository.dart';
import 'package:flutter/foundation.dart';
import '../data/producto.dart';

class CartViewModel extends ChangeNotifier {
  final CartRepository _cartRepository = CartRepository();

  List<Producto> get items => _cartRepository.items;
  int get count => _cartRepository.count;
  double get total => _cartRepository.total;

  void addProduct(Producto p) {
    _cartRepository.add(p);
    notifyListeners();
  }

  void removeProduct(Producto p) {
    _cartRepository.remove(p);
    notifyListeners();
  }

  void clear() {
    _cartRepository.clear();
    notifyListeners();
  }
}
