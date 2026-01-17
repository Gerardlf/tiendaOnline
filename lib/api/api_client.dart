import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../data/product.dart';

class ApiClient {
  final String baseUrl;

  ApiClient({this.baseUrl = 'https://fakestoreapi.com'});

  //obtenemos la lista de productos

  Future<List<Product>> fetchProducts({String? category}) async {
    Uri uri;

    //construimos la uri dependiendo si hay categoria o no

    if (category != null && category.isNotEmpty) {
      uri = Uri.parse('$baseUrl/products/category/$Category');
    } else {
      uri = Uri.parse('$baseUrl/products');
    }

    final respuesta = await http.get(uri).timeout(const Duration(seconds: 10));

    if (respuesta.statusCode != 200) {
      throw Exception(
        'Error al cargar los productos \n Error: ${respuesta.statusCode}',
      );
    }

    final datos = jsonDecode(respuesta.body) as List;
    return datos
        .map((element) => Product.fromJson(element as Map<String, dynamic>))
        .toList();
  }
}
