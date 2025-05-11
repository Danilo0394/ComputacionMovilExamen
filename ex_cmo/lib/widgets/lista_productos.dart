/*import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/cart_provider.dart';
import 'package:flutter_application_1/screens/lista_productos_screen.dart';
import 'package:flutter_application_1/services/product_service.dart';
import 'package:provider/provider.dart';

class ListaProductos extends StatelessWidget {
  const ListaProductos({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    if (productService.isLoading) return Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Productos'),
      ),
      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (BuildContext context, index) {
          final product = productService.products[index];
          return Container(
            color: Colors.grey,
            padding: EdgeInsets.all(32),
            height: 350,
            child: Center(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      product.productImage,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      color: Colors.red,
                      width: 200,
                      child: Text(product.productName, style: TextStyle(fontSize: 24)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      color: Colors.red,
                      child: Text('\$${product.productPrice}', style: TextStyle(fontSize: 24)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      color: Colors.red,
                      child: IconButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false).addProduct(product);
                        },
                        icon: Icon(Icons.add_shopping_cart),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListaProductosScreen()),
          );
        },
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/cart_provider.dart';
import 'package:flutter_application_1/services/product_service.dart';
import 'package:flutter_application_1/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

class ListaProductos extends StatelessWidget {
  const ListaProductos({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    if (productService.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Productos'),
      ),
      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (BuildContext context, index) {
          final product = productService.products[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              leading: Image.network(product.productImage, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(product.productName),
              subtitle: Text("\$${product.productPrice}"),
              trailing: PopupMenuButton<String>(
                onSelected: (value) async {
                  if (value == 'ver') {
                    _showProductDetails(context, product);
                  } else if (value == 'editar') {
                    productService.SelectProduct = product;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProductScreen()),
                    );
                  } else if (value == 'eliminar') {
                    await productService.deleteProduct(product, context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Producto eliminado correctamente'))
                    );
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'ver',
                    child: Text('Ver Producto'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'editar',
                    child: Text('Editar Producto'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'eliminar',
                    child: Text('Eliminar Producto'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProductScreen()),
          );
        },
      ),
    );
  }

  void _showProductDetails(BuildContext context, product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(product.productName),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(product.productImage),
              SizedBox(height: 10),
              Text("Precio: \$${product.productPrice}"),
              SizedBox(height: 10),
              Text("Estado: ${product.productState}"),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}