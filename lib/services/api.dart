import 'dart:convert';
import 'dart:io';
import '../models/Category.dart';
import 'package:http/http.dart' as http;

class ApiService{
  ApiService();

  final String baseUrl='http://10.0.2.2:8000/api/';

  Future<List<Category>> fetchCategories() async {
    http.Response response = await http.get(Uri.parse(baseUrl+'categories'));
    List categories = jsonDecode(response.body);
    print(response.body);
    return categories.map((category) => Category.fromJson(category)).toList();
  }

  Future<Category> updateCategory(id,name) async {
    String uri =
        baseUrl+'categories/' + id.toString();
    http.Response response = await http.put(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json'
        },
        body: jsonEncode({'name': name})
    );
    if(response.statusCode!=200){
      throw Exception('Error en update category');
    }
    return Category.fromJson(jsonDecode(response.body));
  }
}