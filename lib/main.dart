
import 'package:camel/statics/bottom_navigation.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:camel/ui/about.dart';
import 'package:camel/ui/buy_slices.dart';
import 'package:camel/ui/confirm_order.dart';
import 'package:camel/ui/contact_us.dart';
import 'package:camel/ui/hashy.dart';
import 'package:camel/ui/hashy_meat.dart';
import 'package:camel/ui/slices.dart';
import 'package:camel/ui/snap_chat.dart';
import 'package:camel/ui/splash_screen.dart';
import 'package:camel/ui/test_cupertino.dart';
import 'package:camel/ui/zabaeh.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder:(context,widget){
        return Directionality(textDirection: TextDirection.rtl, child: widget);
      },
      title: 'الجود',
      theme: ThemeData(
        bottomAppBarColor: GoodColors.grey,
      ),
      home: BottomNavigationBarClass(1),
    );
  }
}