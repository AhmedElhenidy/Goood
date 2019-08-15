import 'package:camel/admin/statics/admin_app_bar.dart';
import 'package:flutter/material.dart';
class Drivers extends StatefulWidget {
  _DriversState createState() => _DriversState();
}
class _DriversState extends State<Drivers>{
  GlobalKey<ScaffoldState> _scaffoldKeyProfile ;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile =GlobalKey<ScaffoldState>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBarClass().appBar(context, _scaffoldKeyProfile,"السائقون"),
    );
  }

}