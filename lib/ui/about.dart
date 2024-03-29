import 'package:camel/DataBase/SqliteDataBase.dart';
import 'package:camel/statics/app_bar.dart';
import 'package:camel/statics/drawer.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class About extends StatefulWidget{
  _AboutState createState()=> _AboutState();
}
class _AboutState extends State<About>{
  GlobalKey<ScaffoldState> _scaffoldKeyProfile ;
  int count = 0 ;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile =new GlobalKey<ScaffoldState>();

  }
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
    return Scaffold(
      appBar: AppBarClass()
          .appBar(context, _scaffoldKeyProfile, false, count, title: "عن التطبيق"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16,right: 16,top: 8),
                width: MediaQuery.of(context).size.width/1.1,
                height: MediaQuery.of(context).size.height/2.15,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 5,
                      right: 5,
                      bottom: 5,
                      child: Card(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(
                              color: GoodColors.brownLight,
                              width: 3,
                              style: BorderStyle.solid
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          constraints: BoxConstraints(
                              minHeight: 220
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: MediaQuery.of(context).size.height/20,),
                                Text("تطبيق الجود",style: TextStyle(fontSize:18 ,color: GoodColors.brownDark,fontFamily: 'black75',
                                ),),
                                Text("يوفر لعملائه اجواد انواع اللحوم البلدية الطازجة من (الأغنام والحشيان) وبجودة عالية وأسعار منافسة"
                                    ,style: TextStyle(
                                    fontSize:17 ,
                                    color: GoodColors.brownDark,
                                    fontFamily: 'black75',
                                  ),
                                ),
                              ],
                            )
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              child: Image.asset("images/logo.png",width: 100,height: 100,),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //share
                  ],
                ),
              ),
              //لماذا الجود
              Container(
                width: MediaQuery.of(context).size.width/1.22,
                height: MediaQuery.of(context).size.height/3.4,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 42,
                      left: 5,
                      right: 5,
                      bottom: 0,
                      child: Card(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(
                              color: GoodColors.brownLight,
                              width: 3,
                              style: BorderStyle.solid
                          ),
                        ),
                        child: Container(
                          constraints: BoxConstraints(
                              minHeight: 250
                          ),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("يتم اختيار الحلال بحرص مننا لنضمن ان لا يكون ضعيف و يكون سليم من الأمراض والابر"
                                  ,style: TextStyle(fontSize:18 ,color: GoodColors.brownDark,fontFamily: 'black75',),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(top :25.0),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                height: 40,
                                width: 216,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: GoodColors.brownLight
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text("لماذا الجود",
                                    style: TextStyle(fontSize: 17,fontFamily: 'black75',),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //share
                    Positioned(
                      top: 1,
                      right: MediaQuery.of(context).size.width/2.75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("images/sharr.png",
                            width: 40,height: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/1.25,
                height: MediaQuery.of(context).size.height/5.8,
                child: Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                        color: GoodColors.brownLight,
                        width: 3,
                        style: BorderStyle.solid
                    ),
                  ),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("جميع الاعلاف المستخدمة من الشعير والبرسيم"
                            ,style: TextStyle(fontSize:18 ,color: GoodColors.brownDark,
                              fontFamily: 'black75',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Container(
                width: MediaQuery.of(context).size.width/1.25,
                height: MediaQuery.of(context).size.height/5.8,
                child: Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                        color: GoodColors.brownLight,
                        width: 3,
                        style: BorderStyle.solid
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("الذبح فى مسلخ البلدية تحت الإشراف الطبي"
                          ,style: TextStyle(fontSize:18 ,color: GoodColors.brownDark,fontFamily: 'black75',),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/1.25,
                height: MediaQuery.of(context).size.height/5.5,
                child: Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                        color: GoodColors.brownLight,
                        width: 3,
                        style: BorderStyle.solid
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("تغليف معقم ويتم تغليف الطلب بأحدث الأجهزة حتى يتم نقله"
                          ,style: TextStyle(fontSize:18 ,color: GoodColors.brownDark,fontFamily: 'black75',),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/1.25,
                height: MediaQuery.of(context).size.height/5.8,
                child: Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                        color: GoodColors.brownLight,
                        width: 3,
                        style: BorderStyle.solid
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("يمكنك مشاهدة طلبك و الذبح اليومى عبر سناب شات."
                          ,style: TextStyle(fontSize:18 ,color: GoodColors.brownDark,fontFamily: 'black75',),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/1.25,
                height: MediaQuery.of(context).size.height/5.8,
                child: Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                        color: GoodColors.brownLight,
                        width: 3,
                        style: BorderStyle.solid
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("يتم توصيل الطلب حتى باب المنزل"
                          ,style: TextStyle(fontSize:18 ,color: GoodColors.brownDark,fontFamily: 'black75',),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/1.25,
                height: MediaQuery.of(context).size.height/5.8,
                child: Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                        color: GoodColors.brownLight,
                        width: 3,
                        style: BorderStyle.solid
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("خدمة الذبح والتقطيع والتغليف والتوصيل (مجانا)"
                          ,style: TextStyle(fontSize:18 ,color: GoodColors.brownDark,fontFamily: 'black75',),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}