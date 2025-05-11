import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class DetalleProductoScreen extends StatelessWidget {
  const DetalleProductoScreen({super.key});
  @override
  Widget build(BuildContext context) {

    final buscar = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppbarName(name: 'Detalle Producto'),
      body: DetalleProducto(buscar: buscar),
    );
  }
}
