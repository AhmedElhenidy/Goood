import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
class MyAccount extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAccountState();
  }
}
class _MyAccountState extends State<MyAccount>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width/1.5,
              child: Column(
                children: <Widget>[
                  Image.asset("images/man.png"),
                  SizedBox(height: MediaQuery.of(context).size.height/50,),
                  Text("Mohamed Alaa",
                    style: TextStyle(color: GoodColors.brown,fontSize: 25),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top :16.0),
              child: Container(
                padding: EdgeInsets.only(top: 16,bottom: 16),
                width: MediaQuery.of(context).size.width/1.4,
                decoration: BoxDecoration(
                  color: GoodColors.brownLight,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top:4,bottom: 4,right: 16,left: 16),
                          decoration: BoxDecoration(
                            color: GoodColors.brownDark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18),
                              bottomLeft: Radius.circular(18),
                            ),
                          ),
                          child: Text("إجمالى الطلبات",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("7000",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 38,
                          ),
                        ),
                        Text(" ر.س ",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              height: 2
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top :16.0),
              child: InkWell(
                onTap: (){debugPrint("person");},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    color: GoodColors.brownLight,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset("images/info.png",width: 38,height: 38,),

                      Text("المعلومات الشخصية  ",
                        style: TextStyle(
                          fontSize: 14,
                          color: GoodColors.brown
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top :16.0),
              child: InkWell(
                onTap: (){debugPrint("person");},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    color: GoodColors.brownLight,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset("images/shopping_cart.png",width: 38,height: 38,),
                      Text("الطلبات السابقة  ",
                        style: TextStyle(
                          fontSize: 14,
                          color: GoodColors.brown
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top :16.0),
              child: InkWell(
                onTap: (){debugPrint("person");},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    color: GoodColors.brownLight,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset("images/location.png",width: 38,height: 38,),
                      Text("عناوينى  ",
                        style: TextStyle(
                          fontSize: 14,
                          color: GoodColors.brown
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}