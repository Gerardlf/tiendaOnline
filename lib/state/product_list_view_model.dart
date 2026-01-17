import 'package:app_navegacion_estado/api/api_client.dart';
import 'package:app_navegacion_estado/data/product.dart';
import 'package:flutter/foundation.dart';

class ProductListViewModel extends ChangeNotifier {
  final ApiClient _apiClient;

  ProductListViewModel(this._apiClient);

  //estado privado del view model al inicio
  List<Product> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadProducts({String? category}) async {
    //cargando
    _isLoading = true;
    //borro errores previos
    _errorMessage = null;
    notifyListeners();

    try {
      _products = await _apiClient.fetchProducts(category: category);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
