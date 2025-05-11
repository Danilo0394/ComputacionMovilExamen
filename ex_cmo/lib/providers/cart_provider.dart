import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/productos.dart';

class CartProvider extends ChangeNotifier {
  List<Listado> products = [];

  int get itemCount => products.length;
  List<Listado> get getProducts => products;

  void addProduct(Listado product) {
    products.add(product.copy());
    notifyListeners();
  }

  void deleteProduct(String nombreProducto){
    final index = products.indexWhere(
      (product) => product.productName == nombreProducto
    );

    if (index != -1){
      products.removeAt(index);
      notifyListeners();
    }
    else {
      print('No se pudo borrar el producto $nombreProducto');
    }
  }

  void clearCart(){
    products.clear();
    notifyListeners();
  }
}