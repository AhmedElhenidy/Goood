import 'package:camel/statics/good_colors.dart';
import 'package:camel/ui/about.dart';
import 'package:camel/ui/contact_us.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation.dart';
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
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: 100,
                        height: 50,
                        child: Image.asset("images/logo.png",),
                      ),
                    ),
                   // SizedBox(height: MediaQuery.of(context).size.height/50,),
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
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>BottomNavigationBarClass(1)
                      ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0,left: 20.0),
                    child: Divider(color: GoodColors.grey,),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/55,),
                  new ListTile(
                    title: new Text(
                      "حسابى",
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: GoodColors.brownDark,
                          ),
                      textAlign: TextAlign.right,
                    ),
                    leading: new Image.asset("images/man.png",
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
                      "عن التطبيق",
                      style: new TextStyle(
                          fontSize: 20.0,
                          color:GoodColors.brownDark,
                          fontFamily: 'JF Flat'),
                      textAlign: TextAlign.right,
                    ),
                    leading: new Image.asset("images/about.png",
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>ContactUs()),);
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
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>ContactUs()),);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0,left: 20.0),
                    child: Divider(color: GoodColors.grey,),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/55,),
                  new ListTile(
                    title: new Text(
                      "مشاركة التطبيق مع الأصدقاء",
                      style: new TextStyle(
                          fontSize: 20.0,
                          color:GoodColors.brownDark,
                          fontFamily: 'JF Flat'),
                      textAlign: TextAlign.right,
                    ),
                    leading: new Image.asset("images/share.png",
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>ContactUs()),);
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