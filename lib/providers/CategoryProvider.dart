

import 'package:flutter/material.dart';
import 'package:flutter_api/models/Category.dart';
import 'package:flutter_api/services/api.dart';

class CategoryProvider extends ChangeNotifier{
  List<Category> categories=[];
  late ApiService apiService;

  CategoryProvider(){
    this.apiService=ApiService();
    init();
  }

  Future init() async{
    categories= await apiService.fetchCategories();
    notifyListeners();
  }
}