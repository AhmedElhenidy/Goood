import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:camel/admin/model/driver.dart';

class DriverApi{
  static  const String  URL = "http://goot.drugs-house.com/" ;
  static  Future<DriverOperationsServerResponse> getAllDriver()async{
    String url =URL+"api/driver/getAllDriver";
    print(url);
    final response= await http.get(url);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return DriverOperationsServerResponse.fromJson(jsonResponse);
  }
  static  Future<DriverOperationsServerResponse> addNewDriver(String name,String phone)async{
    String url =URL+"api/driver/addNewDriver?name=$name&phone=$phone";
    print(url);
    final response= await http.post(url);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return DriverOperationsServerResponse.fromJson(jsonResponse);
  }
  static  Future<DriverOperationsServerResponse> updateDriver(int id,String name,String phone)async{
    String url =URL+"api/driver/updateDriver/$id?name=$name&phone=$phone";
    print(url);
    final response= await http.post(url);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return DriverOperationsServerResponse.fromJson(jsonResponse);
  }
  static  Future<DriverOperationsServerResponse> deleteDriver(int id)async{
    String url =URL+"api/driver/deleteDriver/$id";
    print(url);
    final response= await http.post(url);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return DriverOperationsServerResponse.fromJson(jsonResponse);
  }
}