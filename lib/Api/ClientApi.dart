
import 'dart:ui';

import 'package:camel/model/OrderModel.dart';
import 'package:camel/model/OrderToSent.dart';
import 'package:camel/model/ProductPricesModel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class ClientApi{
  static  const String  URL = "http://goot.drugs-house.com/" ;

static  Future<ProductPriceModel> getPrices()async{
  String url =URL+"api/Product/getAllProduct";
  print(url);
  final respones = await http.get(url );
  final jsonResponse = json.decode(respones.body);
  print(jsonResponse);
  return ProductPriceModel.fromJson(jsonResponse);
}

    static Future<OrderModel> addOrder(OrderToSent order)async{
      print("order Sended ${order.toJson()}" );
      String url =URL+"api/order/addNeworder";
      print(url);
      final response = await http.post(url ,body:order.toJson());
      print("all response :: ${response.body}");
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return OrderModel.fromJson(jsonResponse);
    }

    static Future<bool> addShippingInfo(int orderId , String name , String address , String phone , String timeOrder ,String note) async{
      String url =URL+"api/order/orderInfo/$orderId?lat=112.3226&lng=12154554&name=$name&note=$note&address=$address&phone_1=$phone&time_order=$timeOrder";
      print(url);
      final respones = await http.post(url);
      final jsonResponse = json.decode(respones.body);
      print(jsonResponse);
      return jsonResponse['errors'];
    }
}