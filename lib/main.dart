import 'package:camel/DataBase/SqliteDataBase.dart';
import 'package:camel/statics/bottom_navigation.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:camel/ui/confirm_order.dart';
import 'package:camel/ui/contact_us.dart';
import 'package:camel/ui/hashy_category.dart';
import 'package:camel/ui/login_page.dart';
import 'package:camel/ui/snap_chat.dart';
import 'package:camel/ui/splash_screen.dart';

import 'package:flutter/material.dart';

import 'DataBase/config.dart';
import 'admin/PricesPage.dart';
import 'admin/PromoCode.dart';
import 'admin/home.dart';
import 'model/OrderModel.dart';


void main() {
  initDb();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder:(context,widget){
        return Directionality(textDirection: TextDirection.rtl, child: widget);
      },
      title: 'الجود',
      theme: ThemeData(
        //canvasColor: Colors.transparent,
        bottomAppBarColor: GoodColors.grey,
      ),
      home: SplashScreen(),
    );
  }
}