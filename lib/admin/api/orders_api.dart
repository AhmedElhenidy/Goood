import 'package:camel/admin/model/order.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class OrdersApi{
  static  const String  URL = "http://goot.drugs-house.com/" ;
  static  Future<GetAllOrdersServerResponse> getAllProducts()async{
    String url =URL+"api/order/getAllorder";
    print(url);
    final response= await http.get(url);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return GetAllOrdersServerResponse.fromJson(jsonResponse);
  }
}