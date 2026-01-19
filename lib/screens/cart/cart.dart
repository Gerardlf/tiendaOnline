import 'package:app_navegacion_estado/state/cart_view_model.dart';
import 'package:app_navegacion_estado/widgets/responsive_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartViewModel>();

    return ResponsiveScaffold(
      currentIndex: 1,
      onTab: (value) {
        if (value == 0) context.goNamed("home");
        if (value == 1) context.goNamed("cart");
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(
            "Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                tooltip: "Vaciar Carrito",
                onPressed: () {
                  cart.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Carrito vaciado"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                icon: Icon(
                  Icons.delete_forever,
                  color: const Color.fromARGB(255, 250, 1, 1),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.count,
                itemBuilder: (context, i) {
                  final producto = cart.items[i];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => {context.goNamed("detail", extra: producto)},
                      child: Card(
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Id: ${producto.id}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  Image.network(
                                    producto.imageUrl,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, _, _) =>
                                        Icon(Icons.image_not_supported),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      producto.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                " ${producto.price.toStringAsFixed(2)} €",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),

                          trailing: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                            ),
                            icon: Icon(Icons.delete, color: Colors.white),
                            onPressed: () {
                              cart.removeProduct(producto);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${producto.title} eliminado del carrito",
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            label: Text(
                              "Eliminar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.shopping_bag_rounded,
                        color: Colors.indigo,
                      ),
                      label: Text(
                        "Seguir Comprando",
                        style: TextStyle(fontSize: 18, color: Colors.indigo),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blueAccent,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () => context.goNamed("home"),
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.payment, color: Colors.white),
                      label: Text(
                        "Pagar ${cart.total.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {},
                    ),
                  ), //No hay navegacion a pagar!!!!!!
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
