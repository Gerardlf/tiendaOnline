import 'package:app_navegacion_estado/state/product_list_view_model.dart';
import 'package:app_navegacion_estado/widgets/report_table.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String? categorySeleccionada;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductListViewModel>();
    final productosFiltrados = categorySeleccionada == null
        ? viewModel.products
        : viewModel.products
              .where((p) => p.category == categorySeleccionada)
              .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Informe',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.goNamed("home"),
        ),
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : (viewModel.errorMessage != null)
          ? Center(
              child: Text(
                viewModel.errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            )
          : (viewModel.products.isEmpty)
          ? const Center(
              child: Text(
                'No hay productos disponibles.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //filtro de categoría
                  DropdownButton<String?>(
                    isExpanded: true,
                    value: categorySeleccionada,
                    hint: const Text("Todas las categorías"),
                    items: [
                      //opcion todas las categorias
                      const DropdownMenuItem<String?>(
                        value: null,
                        child: Text("Todas"),
                      ),
                      //opciones de categorias de la lista
                      ...viewModel.products
                          .map((p) => p.category)
                          .toSet()
                          .map(
                            (c) => DropdownMenuItem<String?>(
                              value: c,
                              child: Text(c),
                            ),
                          ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        categorySeleccionada = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  //calculo del total de productos mostrados
                  Text(
                    'Total de productos: ${productosFiltrados.length}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  //tabla de productos
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ReportTable(products: productosFiltrados),
                  ),
                ],
              ),
            ),
    );
  }
}
