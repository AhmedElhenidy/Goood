import 'dart:convert';
import 'package:http/http.dart' as http;
class HomeApi{
  static  const String  URL = "http://goot.drugs-house.com/" ;
  static  Future<bool> updateToken(String token)async{
    String url =URL+"api/fireBaseToken/update?fireBaseToken=$token";
    print(url);
    final response= await http.post(url );
    final jsonResponse = json.decode(response.body);
    print("token  Response : : $jsonResponse");
    return jsonResponse['errors'];
  }
}