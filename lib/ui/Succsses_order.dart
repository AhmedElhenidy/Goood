import 'dart:async';


import 'package:camel/statics/bottom_navigation.dart';
import 'package:camel/ui/home_page.dart';
import 'package:flutter/material.dart';

class SuccessOrder extends StatefulWidget{
  _SuccesseOrderState createState()=> _SuccesseOrderState();
}
class _SuccesseOrderState extends State<SuccessOrder>{
  Timer timer;

  @override
  void dispose() {
    super.dispose();
    timer.cancel() ;
  }
  @override
  Widget build(BuildContext context) {
    timer =new Timer(const Duration(milliseconds: 2000),
            () {
          Navigator.of(context).pushReplacement(new MaterialPageRoute(
              builder: (BuildContext context) =>  BottomNavigationBarClass(1)));

        });
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Flexible(
              child: Container(
                /*child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.close,color: Colors.black,size: 35,),
                    onPressed: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> BottomNavigationClass()));
                    },
                  ),
                ),*/
              ),
              flex: 1,
            ),
            Flexible(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Image.asset("images/Success.png"),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/30,),
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text("تم ارسال",style: TextStyle(fontSize: 35),softWrap: true,),
                            Text("الطلب",style: TextStyle(fontSize: 40),softWrap: true,),
                            Text("بنجاح",style: TextStyle(fontSize: 35),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }

}