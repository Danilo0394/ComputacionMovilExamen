import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/proveedores.dart';
import 'package:flutter_application_1/services/proveedores_service.dart';

class ProveedorProvider with ChangeNotifier {
  List<Proveedor> _proveedores = [];
  bool _isLoading = false;

  List<Proveedor> get proveedores => _proveedores;
  bool get isLoading => _isLoading;

  Future<void> loadSuppliers() async {
    _isLoading = true;
    notifyListeners();
    try {
      _proveedores = await ProveedorService.fetchSuppliers();
    } catch (e) {
      print("Error al cargar proveedores: \$e");
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveProveedor(Proveedor proveedor) async {
    await ProveedorService.createOrUpdateSupplier(proveedor);
    loadSuppliers();
  }

  Future<void> deleteSupplier(int id) async {
    try {
      await ProveedorService.deleteSupplier(id);
      _proveedores.removeWhere((proveedor) => proveedor.id == id);
      notifyListeners();
    } catch (e) {
      print("Error al eliminar proveedor: \$e");
    }
  }

  Proveedor findById(int id) {
    return _proveedores.firstWhere((proveedor) => proveedor.id == id);
  }
}
