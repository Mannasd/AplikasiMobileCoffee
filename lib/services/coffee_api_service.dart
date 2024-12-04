import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/coffee_model.dart';

class CoffeeApiService {
  static const String _baseUrl = 'https://api.sampleapis.com/coffee';

  static Future<List<CoffeeModel>> fetchCoffees(String type) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/$type'));
      
      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        return body.map((item) => CoffeeModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load coffees');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}