import 'package:app_navegacion_estado/data/product.dart';
import 'package:flutter/material.dart';

class ReportTable extends StatelessWidget {
  final List<Product> products;

  const ReportTable({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text("Título")),
        DataColumn(label: Text("Categoría")),
        DataColumn(label: Text("Precio")),
      ],
      rows: products.map((p) {
        return DataRow(
          cells: [
            DataCell(
              SizedBox(
                width: 180,
                child: Text(
                  p.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataCell(Text(p.category)),
            DataCell(Text("${p.price.toStringAsFixed(2)} €")),
          ],
        );
      }).toList(),
    );
  }
}
