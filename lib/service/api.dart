import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hw_day8/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Api {
  String link = "https://dummyjson.com/products";
  final supabase = Supabase.instance.client;

  Future<List<ProductModel>> getProducts() async {
    var uri = Uri.parse(link);
    var response = await http.get(uri);
    var result = jsonDecode(response.body);
    print(result);

    List<ProductModel> list = [];

    for (var item in result["products"]) {
      ProductModel c1 = ProductModel.fromJson(item);
      list.add(c1);
    }

    return list;
  }
    
  signUp({required String email,required String password}) async {
    await supabase.auth.signUp(email: email, password: password);
  }

  login({required String email,required String password}) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
    
  }
}