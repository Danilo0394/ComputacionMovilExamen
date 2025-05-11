import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../screens/screens.dart';
import '../widgets/widgets.dart';

class DetalleProducto extends StatelessWidget {
  final String buscar;
  const DetalleProducto({super.key, required this.buscar});
  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductService>(context);

    if (productService.isLoading) return LoadingScreen();

    final buscarProducto = productService.products.where(
      (product) => product.productName.toLowerCase() == (buscar.toLowerCase()),
    );

    if (buscarProducto.isEmpty){
      return Center(
        child: Column(
          children: [
            NavBar(),
            SizedBox(height: 30),
            Text('No se encontró ningún producto con el nombre $buscar'),
            IconText(icon: Icons.arrow_back, iconName: 'Volver a búsqueda', route: 'busqueda')
          ],
        ),
      );
    }
    else{
      final productoEncontrado = buscarProducto.first;
      return ListView(
      children: [
        NavBar(),
        Center(
          child: Image(
            image: NetworkImage(productoEncontrado.productImage), width: MediaQuery.of(context).size.width, height: 350, fit: BoxFit.cover
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 20, color: Colors.black),
              children: [
                TextSpan(
                  text: ('Nombre: '),
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                TextSpan(
                  text: '${productoEncontrado.productName}\n'
                ),
                TextSpan(
                  text: ('Precio: '),
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                TextSpan(
                  text: '\$${productoEncontrado.productPrice}\n'
                ),
                TextSpan(
                  text: ('Estado: '),
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                TextSpan(
                  text: '${productoEncontrado.productState}\n'
                ),
                TextSpan(
                  text: ('ID: '),
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                TextSpan(
                  text: '${productoEncontrado.productId}\n'
                ),
                ]
              )
            ),
          ),
          IconText(
            icon: (Icons.arrow_back),
            iconName: 'Volver a lista de productos',
            route: 'lista_productos'
          )
        ],
      );
    }
  }
}