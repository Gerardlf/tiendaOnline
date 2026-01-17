import 'package:app_navegacion_estado/data/cart_repository.dart';
import 'package:flutter/foundation.dart';
import '../data/product.dart';

class CartViewModel extends ChangeNotifier {
  final CartRepository _cartRepository = CartRepository();

  List<Product> get items => _cartRepository.items;
  int get count => _cartRepository.count;
  double get total => _cartRepository.total;

  void addProduct(Product p) {
    _cartRepository.add(p);
    notifyListeners();
  }

  void removeProduct(Product p) {
    _cartRepository.remove(p);
    notifyListeners();
  }

  void clear() {
    _cartRepository.clear();
    notifyListeners();
  }
}
