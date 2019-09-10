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
  static  Future<GetAllOrdersServerResponse> orderUpdateInfo(int id,String lat,String lang,String name,String note
      ,String address,String phone,String time)async{
    String url =URL+"api/order/orderInfo/$id?lat=$lat&lng=$lang&name=$note&note=$note&address=$address&phone_1=$phone&time_order=$time";
    print(url);
    final response= await http.get(url);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return GetAllOrdersServerResponse.fromJson(jsonResponse);
  }
  static  Future<GetAllOrdersServerResponse> deleteOrder(int id)async{
    String url =URL+"api/order/deleteorder/$id";
    print(url);
    final response= await http.get(url);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return GetAllOrdersServerResponse.fromJson(jsonResponse);
  }
}