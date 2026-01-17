class ApiClient {
  final String baseUrl;

  ApiClient({this.baseUrl = 'https://fakestoreapi.com'});

  //obtenemos la lista de productos

  Future<List<Product>> fetchProducts() async {
    Uri uri;
  }
}
