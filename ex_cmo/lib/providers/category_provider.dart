import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/categorias.dart';
import 'package:flutter_application_1/services/categoria_service.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];
  bool _isLoading = false;

  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> loadCategories() async {
    _isLoading = true;
    notifyListeners();
    try {
      _categories = await CategoryService.fetchCategories();
       print("Datos recibidos en el Provider: $_categories");
    } catch (e) {
      print("Error al cargar categorías: \$e");
    }
    _isLoading = false;
    notifyListeners();
  }
}