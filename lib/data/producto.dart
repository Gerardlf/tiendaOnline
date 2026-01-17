import 'package:flutter/widgets.dart';

class Producto {
  final String id;
  final String nombre;
  final double precio;
  final String descripcion;
  final IconData iconData;

  Producto(this.id, this.nombre, this.precio, this.descripcion, this.iconData);
}
