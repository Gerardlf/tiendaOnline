import 'package:app_navegacion_estado/data/producto.dart';

class CartRepository {
  final List<Producto> _items = [];

  List<Producto> get items => List.unmodifiable(_items);
  int get count => _items.length;
  double get total => _items.fold(0, (sum, p) => sum + p.precio);

  void add(Producto p) {
    _items.add(p);
  }

  void remove(Producto p) {
    _items.remove(p);
  }

  void clear() {
    _items.clear();
  }
}
