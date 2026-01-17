import 'package:app_navegacion_estado/data/fake_products.dart';
import 'package:app_navegacion_estado/state/cartViewModel.dart';
import 'package:app_navegacion_estado/state/product_list_view_model.dart';
import 'package:app_navegacion_estado/widgets/product_card_api.dart';
import 'package:app_navegacion_estado/widgets/responsive_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ui_components/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Cargo productos al entraren la pantalla llamando al view model
  @override
  void initState() {
    super.initState();
    //Uso addPostFrameCallback para asegurar esperar a que el build se complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductListViewModel>().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartViewModel>();
    final viewModel = context.watch<ProductListViewModel>();

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
        body: viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : (viewModel.errorMessage != null)
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      viewModel.errorMessage!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => viewModel.loadProducts(),
                      child: Text("Reintentar"),
                    ),
                  ],
                ),
              )
            : (viewModel.products.isEmpty)
            ? const Center(child: Text("No hay productos disponibles"))
            : ListView.builder(
                itemCount: viewModel.products.length,
                itemBuilder: (context, i) {
                  final producto = viewModel.products[i];

                  return InkWell(
                    onTap: () {},
                    child: ProductCardApi(
                      id: producto.id,
                      title: producto.title,
                      price: producto.price,
                      category: producto.category,
                      imageUrl: producto.imageUrl,

                      onAdd: () {
                        //cart.addProduct(producto);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "${producto.title} añadido al carrito",
                            ),
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
