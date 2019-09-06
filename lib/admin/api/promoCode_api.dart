import 'dart:convert';
import 'package:camel/admin/model/promo_code.dart';
import 'package:http/http.dart' as http;

class PromoCodeApi{
  static  const String  URL = "http://goot.drugs-house.com/" ;
  static  Future<GetAllPromoCodeServerResponse> getAllPromoCodes()async{
    String url =URL+"api/promocode/getAllpromocode";
    print(url);
    final response= await http.get(url);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return GetAllPromoCodeServerResponse.fromJson(jsonResponse);
  }
  static  Future<PromoCodeServerResponse> addNewPromoCode(String codeName,String startDate,String endDate,String amount)async{
    String url =URL+"api/promocode/addNewpromocode?codeName=$codeName&startDate=$startDate&endDate=$endDate&amount=$amount";
    print(url);
    final response= await http.post(url);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return PromoCodeServerResponse.fromJson(jsonResponse);
  }
  static  Future<PromoCodeServerResponse> updatePromo(int id,String codeName,String startDate,String endDate,String amount)async{
    String url =URL+"api/promocode/updatepromocode/$id?codeName=$codeName&startDate=$startDate&endDate=$endDate&amount=$amount";
    print(url);
    final response= await http.post(url);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return PromoCodeServerResponse.fromJson(jsonResponse);
  }
  static  Future<PromoCodeServerResponse> deletePromo(int id)async{
    String url =URL+"api/promocode/deletepromocode/$id";
    print(url);
    final response= await http.post(url);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return PromoCodeServerResponse.fromJson(jsonResponse);
  }
}