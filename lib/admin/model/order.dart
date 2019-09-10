import 'package:camel/model/OrderModel.dart';

class GetAllOrdersServerResponse{
  List<Order> orderList;
  bool errors;
  String message_ar;
  GetAllOrdersServerResponse({this.orderList,this.errors,this.message_ar});
  factory GetAllOrdersServerResponse.fromJson(Map<String, dynamic> json) {
    return GetAllOrdersServerResponse(
      orderList: json['orders'] != null ? (json['orders'] as List).map((i) => Order.fromJson(i)).toList() : null,
      errors: json['errors'],
      message_ar: json['mmessage_ar'],
    );
  }
}