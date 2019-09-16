import 'dart:async';

import 'package:camel/Api/ClientApi.dart';
import 'package:camel/DataBase/SqliteDataBase.dart';
import 'package:camel/DataBase/config.dart';
import 'package:camel/statics/app_bar.dart';
import 'package:camel/statics/drawer.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:camel/ui/about.dart';
import 'package:camel/ui/home_page.dart';
import 'package:camel/ui/likes.dart';
import 'package:camel/ui/my_account.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

import 'DataBaseConstants.dart';
class BottomNavigationBarClass extends StatefulWidget{
  int initial ;
  BottomNavigationBarClass(this.initial);
  _BottomNavigationClassState createState()=> _BottomNavigationClassState();
}
class _BottomNavigationClassState extends State<BottomNavigationBarClass>{
  int _page =0;
  GlobalKey<ScaffoldState> _globalKeyScafoldState;
  PageController _pageController;
  navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 100), curve: Curves.ease);
  }
  void onPageChanged(int page){
    print(page);
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _globalKeyScafoldState = new GlobalKey<ScaffoldState>();
    _pageController = new PageController();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => navigationTapped(widget.initial));
  }
  int count = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies() ;
    SqlLiteDataBase.getShoppingCartCount().then((count){
      setState(() {
        this.count = count ;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    BottomNavigationBarItem account =  BottomNavigationBarItem(
        title: new Container(),
        icon: new Column(
          children: <Widget>[
            Container(
              width: 24.0,
              height: 24.0,
              child:  Icon(Icons.info,size: 26,
                color: _page == 2?GoodColors.brown: GoodColors.grey,
               ),
            ),
            new Container(height: 4.0),
            new Text("عن التطبيق",
                style: new TextStyle(
                  color: _page == 2?GoodColors.brown:Colors.grey,
                  fontSize: 12.0,
                  fontFamily: 'bold65',
                ))
          ],
        )
    );
    BottomNavigationBarItem wishList =  BottomNavigationBarItem(
        title: Container(),
        icon:  Column(
          children: <Widget>[
            Container(
              width: 24.0,
              height: 24.0,
              child:  _page == 0?Icon(Icons.favorite,size: 24,
                color: GoodColors.brown,
              ):Icon(Icons.favorite_border,size: 26,
                color: GoodColors.grey,
              ),
            ),
             Container(height: 4.0),
             Text("المفضلة",
                style: new TextStyle(
                  color: _page == 0?GoodColors.brown:Colors.grey,
                  fontSize: 12.0,
                  fontFamily: 'bold65',
                ))
          ],
        )
    );
    BottomNavigationBarItem home =  BottomNavigationBarItem(
        title: new Container(),
        icon: new Column(
          children: <Widget>[
            Container(
              width: 24.0,
              height: 24.0,
              child:  Icon(Icons.home,size: 26,
                color: _page == 1?GoodColors.brown :GoodColors.grey,),
            ),
            new Container(height: 4.0),
            new Text("الرئيسية",
                style: new TextStyle(
                  color: _page == 1 ?GoodColors.brown:GoodColors.grey,
                  fontSize: 12.0,
                  fontFamily: 'bold65',
                ))
          ],
        ));
    Widget bottomNavigationBarWidget =  ClipRRect(
        borderRadius:  BorderRadius.only(
          topLeft:  Radius.circular(25) ,
          topRight:  Radius.circular(20),
        ),
        child:Container(
          padding: EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(color: Color(0x22000000),   blurRadius: 3)
            ]
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: [
              wishList,
              home,
              account,
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          ),
        )
    );
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerClass().showDrawer(context),
      key: _globalKeyScafoldState,
      bottomNavigationBar: bottomNavigationBarWidget,
      appBar: new AppBarClass().appBar(context ,_globalKeyScafoldState ,true,count ,
          title: _page==0?"المفضلة":_page==1?"logo":"عن الجود"
      ),
      body: new PageView(
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          reverse: false,
          physics: const BouncingScrollPhysics(),
          children: [
            Likes(),
            HomePage(),
            About(),
          ],
          controller: _pageController,
          onPageChanged: onPageChanged),
    );
  }






}