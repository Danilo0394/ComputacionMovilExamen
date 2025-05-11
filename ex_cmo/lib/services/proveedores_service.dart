import 'package:flutter_application_1/models/proveedores.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProveedorService {
  static const String baseUrl = 'http://143.198.118.203:8100';

  static Future<List<Proveedor>> fetchSuppliers() async {
    final response = await http.get(Uri.parse('\$baseUrl/ejemplos/supplier_list_rest/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Proveedor.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load suppliers');
    }
  }

  static Future<void> deleteSupplier(int id) async {
    final response = await http.delete(Uri.parse('\$baseUrl/ejemplos/proveedor_delete_rest/\$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete proveedor');
    }
  }

  static Future<Proveedor> fetchSupplierById(int id) async {
    final response = await http.get(Uri.parse('\$baseUrl/ejemplos/supplier_detail_rest/\$id'));
    if (response.statusCode == 200) {
      return Proveedor.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch supplier');
    }
  }

  static Future<void> createOrUpdateSupplier(Proveedor supplier) async {
    final url = supplier.id == 0
        ? Uri.parse('\$baseUrl/ejemplos/supplier_create_rest/')
        : Uri.parse('\$baseUrl/ejemplos/supplier_update_rest/\${supplier.id}');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(supplier.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to save proveedor');
    }
  }
}