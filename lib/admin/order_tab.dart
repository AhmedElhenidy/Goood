import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
class OrderTab extends StatefulWidget{
  _OrderTabState createState()=>_OrderTabState();
}
class _OrderTabState extends State<OrderTab>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.red,
    );
  }

}