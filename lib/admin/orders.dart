import 'package:camel/admin/statics/admin_app_bar.dart';
import 'package:flutter/material.dart';
class Orders extends StatefulWidget {
  _OrdersState createState() => _OrdersState();
}
class _OrdersState extends State<Orders>{
  GlobalKey<ScaffoldState> _scaffoldKeyProfile ;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile =GlobalKey<ScaffoldState>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBarClass().appBar(context, _scaffoldKeyProfile,"الطلبات"),
    );
  }

}