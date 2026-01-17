import 'package:app_navegacion_estado/data/fake_products.dart';
import 'package:app_navegacion_estado/state/cartViewModel.dart';
import 'package:app_navegacion_estado/widgets/responsive_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ui_components/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartViewModel>();

    return ResponsiveScaffold(
      currentIndex: 0,
      onTab: (value) {
        if (value == 0) context.goNamed("home");
        if (value == 1) context.goNamed("cart");
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(
            "Home",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Stack(
                children: [
                  const Icon(Icons.shopping_cart, color: Colors.white),
                  if (cart.count > 0)
                    Positioned(
                      right: 0,
                      child: CircleAvatar(
                        radius: 8,
                        child: Text(
                          cart.count.toString(),
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                ],
              ),
              onPressed: () => context.goNamed("cart"),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, i) {
            final producto = products[i];
            return InkWell(
              onTap: () => context.goNamed("detail", extra: producto),
              child: ProductCard(
                id: producto.id,
                icon: producto.iconData,
                name: producto.nombre,
                precio: producto.precio,
                onAdd: () {
                  cart.addProduct(producto);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${producto.nombre} añadido al carrito"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
