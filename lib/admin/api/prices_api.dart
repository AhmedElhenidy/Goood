import 'package:camel/admin/model/product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class PricesApi{
  static  const String  URL = "http://goot.drugs-house.com/" ;
  static  Future<GetAllPricesServerResponse> getAllPrices()async{
    String url =URL+"api/Product/getAllProduct";
    print(url);
    final response= await http.get(url);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return GetAllPricesServerResponse.fromJson(jsonResponse);
  }
  static  Future<GetAllPricesServerResponse> updatePrices(GetAllPricesServerResponse data)async{
    String url =URL+"api/Product/updatePrice";
    print(url);
    final response= await http.post(url , body: data.toJson());
    final jsonResponse = json.decode(response.body);
    print("Update Price Response : : $jsonResponse");
    return GetAllPricesServerResponse.fromJson(jsonResponse);
  }
}