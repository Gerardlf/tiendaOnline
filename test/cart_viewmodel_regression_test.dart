import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_navegacion_estado/state/cartViewModel.dart';
import 'package:app_navegacion_estado/data/producto.dart';

void main() {
  test("El contador del carrito no debe bajar de 0 (regresión)", () {
    //Creamos el ViewModel del carrito
    final cartViewModel = CartViewModel();

    //Comprobamos que el contador inicial es 0
    expect(cartViewModel.count, 0);

    //Creamos un producto de prueba
    final productoFantasma = Producto(
      "333",
      "Producto Fantasma",
      50.0,
      "Descripción del producto fantasma",
      Icons.help,
    );
    //Intentamos eliminar el producto fantasma (que no está en el carrito)

    cartViewModel.removeProduct(productoFantasma);

    //Comprobamos que el contador sigue siendo 0 y no ha bajado a negativo
    expect(cartViewModel.count, 0);
  });
}
