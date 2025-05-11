import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/lista_proveedores.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'registro';
  static Map<String, Widget Function(BuildContext)> routes = {
    'registro': (BuildContext context) => const RegistroScreen(),
    'login': (BuildContext context) => const LoginScreen(),
    'lista_productos': (BuildContext context) => const ListaProductosScreen(),
    'carro': (BuildContext context) => const CarroScreen(),
    'detalle_producto': (BuildContext context) => const DetalleProductoScreen(),
    'lista_categorias': (BuildContext context) => CategoryScreen(),
    'lista_proveedores': (BuildContext context) => ProveedorFormScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
