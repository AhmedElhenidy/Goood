import 'dart:async';
import 'package:camel/Api/ClientApi.dart';
import 'package:camel/DataBase/config.dart';
import 'package:camel/statics/DataBaseConstants.dart';
import 'package:camel/statics/bottom_navigation.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget{
  _SplashScreenState createState()=> _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{
  Timer timer;

  getPrices(){
    timer =new Timer(const Duration(milliseconds: 1500), () {
      ClientApi.getPrices().then((response) async{
        response.products?.forEach((product)async{
          Map<String,String> row ={
            DataBaseConstants.PRODUCT_TABLE_PRICE : product.price
          };
          await db.update(table: DataBaseConstants.PRODUCT_TABLE, row: row, where: "${DataBaseConstants.PRODUCT_TABLE_ID} = ${product.id}");

          final testResponse= await db.select(table: DataBaseConstants.PRODUCT_TABLE);
          print(testResponse);
        });

        timer =new Timer(const Duration(milliseconds: 1500), () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> BottomNavigationBarClass(1)));
        });
      });
    });


  }
  @override
  Widget build(BuildContext context) {
    getPrices();
     return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.height/2,
            height: MediaQuery.of(context).size.height/2,
              child: Image.asset("images/splash.png",fit: BoxFit.fill,)
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    timer.cancel() ;
  }
}