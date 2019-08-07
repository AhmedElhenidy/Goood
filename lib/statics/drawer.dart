import 'package:camel/statics/good_colors.dart';
import 'package:camel/ui/about.dart';
import 'package:flutter/material.dart';
class DrawerClass{
  Widget showDrawer(BuildContext context) {
    return Container(
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width/1.5,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width/1.5,
              color: GoodColors.brownDark,
              child: Padding(
                padding: const EdgeInsets.only(
                  top :40,
                ),
                child: Column(
                  children: <Widget>[
                    Image.asset("images/man.png"),
                    SizedBox(height: MediaQuery.of(context).size.height/50,),
                    Text("Mohamed Alaa",
                      style: TextStyle(color: Colors.white,fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
            flex: 3,
          ),
          Flexible(
            child: Container(
              color: Colors.white,
              child:Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height/55,),
                  new ListTile(
                    dense: true,
                    title: new Text(
                      "الرئيسية",
                      style: new TextStyle(
                          fontSize: 20,
                          color: GoodColors.brownDark,
                          fontFamily: 'JF Flat'),
                      textAlign: TextAlign.right,
                    ),
                    leading: new Image.asset("images/home_drawer.png",
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0,left: 20.0),
                    child: Divider(color: GoodColors.grey,),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/55,),
                  new ListTile(
                    title: new Text(
                      "عن التطبيق",
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: GoodColors.brownDark,
                          ),
                      textAlign: TextAlign.right,
                    ),
                    leading: new Image.asset("images/about.png",
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0,left: 20.0),
                    child: Divider(color: GoodColors.grey,),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/55,),
                  new ListTile(
                    title: new Text(
                      "تواصل معنا",
                      style: new TextStyle(
                          fontSize: 20.0,
                          color:GoodColors.brownDark,
                          fontFamily: 'JF Flat'),
                      textAlign: TextAlign.right,
                    ),
                    leading: new Image.asset("images/contact.png",
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0,left: 20.0),
                    child: Divider(color: GoodColors.grey,),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/55,),
                  new ListTile(
                    title: new Text(
                      "تسجيل الخروج",
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: GoodColors.brownDark,
                          fontFamily: 'JF Flat'),
                      textAlign: TextAlign.right,
                    ),
                    leading: new Image.asset("images/log_out.png",
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0,left: 20.0),
                    child: Divider(color: GoodColors.grey,),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/55,),
                ],
              ),
            ),
            flex: 6,
          ),
        ],
      ),
    );
  }
}