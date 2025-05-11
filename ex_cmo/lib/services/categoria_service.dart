

import 'dart:convert';

import 'package:flutter_application_1/models/categorias.dart';
import 'package:http/http.dart' as http;

class CategoryService {
static const String baseUrl = 'http://143.198.118.203:8100';

  static Future<List<Category>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse('\$baseUrl/ejemplos/category_list_rest/'));

      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse;
         try {
          jsonResponse = json.decode(response.body);
        } catch (e) {
          return [];
        }
        print("Listado encontrado, cantidad de elementos: ${jsonResponse.length}");

        final filteredData = jsonResponse.where((json) {
          final imageUrl = json['category_image'] ?? '';
          return !imageUrl.contains('imagen.demo') && !imageUrl.contains('via.placeholder.com');
        }).toList();

        print("Datos filtrados (cantidad): ${filteredData.length}");
        print(filteredData);

        final mappedData = filteredData.map((json) => Category.fromJson(json)).toList();
        print("Datos mapeados (cantidad): ${mappedData.length}");
        print(mappedData);

        return mappedData;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print("Error al procesar la respuesta: $e");
      return [];
    }
  }
}