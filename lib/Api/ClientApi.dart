import 'package:camel/admin/model/order.dart';
import 'package:camel/model/DefultServerResponse.dart';
import 'package:camel/model/OrderModel.dart';
import 'package:camel/model/OrderToSent.dart';
import 'package:camel/model/ProductPricesModel.dart';
import 'package:camel/model/User.dart';
import 'package:camel/model/UserServerResponse.dart';
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

  static  Future<DefultServerResponse> promoCode( int orderId,String promoCode )async{
    String url =URL+"api/order/checkPromoCode/$orderId?codeName=$promoCode";
    print(url);
    final respones = await http.post(url );
    final jsonResponse = json.decode(respones.body);
    print(jsonResponse);
    return DefultServerResponse.fromJson(jsonResponse);
  }

  static  Future<DefultServerResponse> contactUs( String name , String mobile , String message )async{
    String url =URL+"api/Product/contact?name=$name&phone=$mobile&message=$message";
    print(url);
    final responds = await http.post(url );
    final jsonResponse = json.decode(responds.body);
    print(jsonResponse);
    return DefultServerResponse.fromJson(jsonResponse);
  }
  static  Future<GetAllOrdersServerResponse> getUserOrder()async{
    User user = await getUser();
    String url =URL+"api/profile/getOrder/${user.id}";
    print(url);
    final responds = await http.get(url );
    final jsonResponse = json.decode(responds.body);
    print(jsonResponse);
    return GetAllOrdersServerResponse.fromJson(jsonResponse);
  }
  static  Future<UserServerResponse> login( String phone , String password  )async{
    String url =URL+"api/user/login?phone=$phone&password=$password";
    print(url);
    final responds = await http.post(url );
    final jsonResponse = json.decode(responds.body);
    print(jsonResponse);
    return UserServerResponse.fromJson(jsonResponse);
  }
  static  Future<UserServerResponse> register( String name , String email ,String phone , String password ,String confirmPassword )async{
    String url =URL+"api/user/register?phone=$phone&password=$password&email=$email&password_confirmation=$confirmPassword&name=$name";
    print(url);
    final responds = await http.post(url );
    final jsonResponse = json.decode(responds.body);
    print(jsonResponse);
    return UserServerResponse.fromJson(jsonResponse);
  }
  static  Future<UserServerResponse> editInfo( int userId,String name , String email ,String phone , String password ,String lngLat )async{
    String url =URL+"api/profile/editInfo/$userId?email=$email&phone=$phone&password=$password&name=$name&latLng=$lngLat";
    print(url);
    final responds = await http.post(url );
    final jsonResponse = json.decode(responds.body);
    print(jsonResponse);
    return UserServerResponse.fromJson(jsonResponse);
  }
}