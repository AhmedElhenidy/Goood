import 'package:camel/admin/PricesPage.dart';
import 'package:camel/admin/PromoCode.dart';
import 'package:camel/admin/api/HomeApi.dart';
import 'package:camel/admin/drivers.dart';
import 'package:camel/admin/offers.dart';
import 'package:camel/admin/orders.dart';
import 'package:camel/admin/statics/admin_app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AdminHome extends StatefulWidget{
  _AdminHomeState createState()=> _AdminHomeState();
}
class _AdminHomeState extends State<AdminHome>{
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  GlobalKey<ScaffoldState> _scaffoldKeyProfile ;

  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile =GlobalKey<ScaffoldState>();
    _firebaseMessaging.onTokenRefresh.listen((String data){
      print("on token refresh $data");
      HomeApi.updateToken(data);
    },onError: (error){
        print(error);
    } ,onDone: (){
      print("done");
    });
    _firebaseMessaging.getToken().then((token){
      print(token);
      HomeApi.updateToken(token);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AdminAppBarClass().appBar(context, _scaffoldKeyProfile,"لوحة التحكم"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Flexible(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //orders
                    InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Orders()));
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 8,bottom: 8),
                        width: MediaQuery.of(context).size.width/2.5,
                       // height: MediaQuery.of(context).size.height/2.5,
                        decoration: BoxDecoration(
                          color: GoodColors.brownDark,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width/2.5,
                               decoration: BoxDecoration(
                                 image: DecorationImage(image: AssetImage("images/cart.png"),fit: BoxFit.contain)
                               ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                child: Center(child: Text("طلبات \nالعملاء",
                                  style: TextStyle(
                                      color: Colors.white ,
                                    fontSize: 14
                                  ),
                                ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(left: 8,right: 8 ,top :8),
                                width: MediaQuery.of(context).size.width/3,
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: GoodColors.brownLight,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    padding: EdgeInsets.only(top: 8,bottom: 8,),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(" 312  ",
                                          style: TextStyle(
                                              color: Colors.white ,

                                          ),
                                        ),
                                        Text("طلب " ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //drivers
                    InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Drivers()));
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 8,bottom: 8),
                        width: MediaQuery.of(context).size.width/2.5,
                   //   height: MediaQuery.of(context).size.height/2.5,
                        decoration: BoxDecoration(
                          color: GoodColors.brownDark,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                child: Image.asset("images/driver.png"),

                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                child: Center(child: Text("السائقون \nالمتاحون",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14
                                    ),
                                  ),
                                ),

                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(left: 8,right: 8 ,top: 8),
                                width: MediaQuery.of(context).size.width/3,
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: GoodColors.brownLight,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    padding: EdgeInsets.only(top: 8,bottom: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(" 55  ",
                                          style: TextStyle(
                                              color: Colors.white
                                          ),
                                        ),
                                        Text("سائق "),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //orders
                    InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>PromoCode()));
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 8,bottom: 8),
                        width: MediaQuery.of(context).size.width/2.5,
                        // height: MediaQuery.of(context).size.height/2.5,
                        decoration: BoxDecoration(
                          color: GoodColors.brownDark,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                child: Image.asset("images/good_code.png"),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                child: Center(child: Text("اكواد\nالخصم",
                                  style: TextStyle(
                                      color: Colors.white ,
                                      fontSize: 14
                                  ),
                                ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(left: 8,right: 8 ,top :8),
                                width: MediaQuery.of(context).size.width/3,
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: GoodColors.brownLight,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    padding: EdgeInsets.only(top: 8,bottom: 8,),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(" 312  ",
                                          style: TextStyle(
                                            color: Colors.white ,

                                          ),
                                        ),
                                        Text("كود " ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //drivers
                    InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>PricesPage()));
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 8,bottom: 8),
                        width: MediaQuery.of(context).size.width/2.5,
                        //   height: MediaQuery.of(context).size.height/2.5,
                        decoration: BoxDecoration(
                          color: GoodColors.brownDark,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                child: Image.asset("images/coin.png"),

                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width/2.5,
                                child: Center(child: Text("خطة\nالاسعار",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14
                                  ),
                                ),
                                ),

                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(left: 8,right: 8 ,top: 8),
                                width: MediaQuery.of(context).size.width/3,
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: GoodColors.brownLight,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    padding: EdgeInsets.only(top: 8,bottom: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(" 8  ",
                                          style: TextStyle(
                                              color: Colors.white
                                          ),
                                        ),
                                        Text("منتجات "),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(right: 20,left: 20),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Offers()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: GoodColors.brownDark,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height/5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(child: Image.asset("images/picture.png",width: 60,height: 60,)),
                        Text("   صور العروض",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset("images/home_pic.png",fit: BoxFit.fill,),
              ),
            ),
          ],
        ),
      ),
    );
  }

}