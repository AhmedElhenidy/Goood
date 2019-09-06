import 'dart:convert';
import 'dart:io';
import 'package:camel/admin/model/slider.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';
class SliderApi{
  static  const String  URL = "http://goot.drugs-house.com/" ;
  static  Future<SliderServerResponse> getAllSlider()async{
    String url =URL+"api/Slider/getAllSlider";
    print(url);
    final response= await http.get(url);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return SliderServerResponse.fromJson(jsonResponse);
  }
  static Future<SliderServerResponse> addNewSlider(File image) async {
    String url =URL+"api/Slider/addNewSlider";
    print(url);
    Map<String, dynamic> responseJson =  new Map();
    var request = new http.MultipartRequest('POST', Uri.parse(url));
    if(image != null ){
      var length = await image.length();
      final stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
      var multiPartFile =  http.MultipartFile(
          'image', stream, length, filename: basename(image.path));
      request.files.add(multiPartFile);
    }
    final response = await request.send();
    await response.stream.transform(utf8.decoder).listen((response) {
      print(response);
      responseJson = json.decode(response);
    }, onError: (error) {
      print(error);
    });
    return  SliderServerResponse.fromJson(responseJson) ;
  }
  static  Future<SliderServerResponse> deleteSlider(int id)async{
    String url =URL+"api/Slider/deleteSlider/$id";
    print(url);
    final response= await http.post(url);
    final jsonResponse = json.decode(response.body);
    print(jsonResponse);
    return SliderServerResponse.fromJson(jsonResponse);
  }
}