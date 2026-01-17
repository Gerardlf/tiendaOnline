import 'package:app_navegacion_estado/data/producto.dart';
import 'package:app_navegacion_estado/state/cartViewModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DetailProduct extends StatelessWidget {
  final Producto producto;
  const DetailProduct({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartViewModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Detail Product",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: BackButton(
          color: Colors.white,
          onPressed: () => context.goNamed("home"),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                Text(" ${producto.id}", style: TextStyle(fontSize: 12)),
                SizedBox(height: 12),
                Icon(producto.iconData, size: 100, color: Colors.indigo),
                Text(
                  " ${producto.nombre}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Text(
                  " ${producto.precio} €",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Descripción:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
                Text(
                  producto.descripcion,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[800],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () => cart.addProduct(producto),
                      icon: Icon(Icons.add_shopping_cart, color: Colors.white),
                      label: Text(
                        "Añadir al carrito",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blueAccent,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () => context.goNamed("cart"),
                      icon: Icon(
                        Icons.shopping_basket_outlined,
                        color: Colors.blueAccent,
                      ),
                      label: Text(
                        "Ir al carrito",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
