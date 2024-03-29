import 'package:camel/DataBase/SqliteDataBase.dart';
import 'package:camel/statics/app_bar.dart';
import 'package:camel/statics/drawer.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
class SnapChat extends StatefulWidget{
  _SnapChatState createState()=> _SnapChatState();
}
class _SnapChatState extends State<SnapChat>{
  int _current = 0;
  GlobalKey<ScaffoldState> _scaffoldKeyProfile ;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile =new GlobalKey<ScaffoldState>();
  }
  int count = 0 ;
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
      drawer: DrawerClass().showDrawer(context),
      appBar: AppBarClass().appBar(context, _scaffoldKeyProfile,false,count),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 16,bottom: 16),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width/1.25,
                height: MediaQuery.of(context).size.height/2.3,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height/14,
                      left: 5,
                      right: 5,
                      bottom:0,
                      child: Card(
                        elevation: 10,
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
                              minHeight: 300
                          ),
                          child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: MediaQuery.of(context).size.height/12,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/1.6,
                                    padding: EdgeInsets.only(top: 8,bottom: 8,left: 8,right: 8),
                                    decoration: BoxDecoration(
                                      color: GoodColors.brownLight,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: InkWell(
                                      onTap: ()=>launch('https://www.snapchat.com/add/almm99'),
                                      child: Center(
                                        child: Text("snapchat.com/add/almm99",
                                          style: TextStyle(
                                            fontFamily: 'black75',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text("عند اضافتنا عبر سناب شات",
                                      style: TextStyle( fontSize: 18,color: GoodColors.brownDark,fontFamily: 'black75',),),
                                  ),
                                  Center(
                                    child: Text("فأنت تتابع طلبك و الذبح اليومي "
                                      ,style: TextStyle(color: GoodColors.brownDark,fontSize: 18,fontFamily: 'black75',),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width/3.5,
                          height: MediaQuery.of(context).size.height/5.65,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: GoodColors.brownDark,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Image.asset("images/snapshat.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    //share
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Container(
                width: MediaQuery.of(context).size.width/1.35,
                padding: EdgeInsets.only(top: 8,bottom: 8),
                decoration: BoxDecoration(
                  color: GoodColors.brownLight,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text("بمشاهدة تحميل الأغنام من البر الي المزارع",
                    style: TextStyle(
                      fontFamily: 'black75',
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/2.3,
                      child: Image.asset("images/snap_section1.png",fit: BoxFit.fill,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/2.3,
                      child: Image.asset("images/snap_sectioon2.png",fit: BoxFit.fill,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Container(
                width: MediaQuery.of(context).size.width/1.35,
                padding: EdgeInsets.only(top: 8,bottom: 8),
                decoration: BoxDecoration(
                  color: GoodColors.brownLight,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text("مشاهدة الذبح والسلخ فى المسلخ",
                    style: TextStyle(
                      fontFamily: 'black75',
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Container(
                child: CarouselSlider(
                  items: [
                    Container(
                      child: Image.asset("images/1.png",fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Image.asset("images/2.png",fit: BoxFit.fill,
                      ),
                    ),
                  ],
                  aspectRatio: 1.45,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                  pauseAutoPlayOnTouch: Duration(seconds: 5),
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Container(
                width: MediaQuery.of(context).size.width/1.35,
                padding: EdgeInsets.only(top: 8,bottom: 8),
                decoration: BoxDecoration(
                  color: GoodColors.brownLight,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text("ومشاهدتها أيضا فى المعمل",
                    style: TextStyle(
                      fontFamily: 'black75',
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width/2.3,
                        child: Image.asset("images/lab1.png",fit: BoxFit.fill,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/2.3,
                      child: Image.asset("images/lab2.png",fit: BoxFit.fill,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Container(
                width: MediaQuery.of(context).size.width/1.35,
                padding: EdgeInsets.only(top: 8,bottom: 8),
                decoration: BoxDecoration(
                  color: GoodColors.brownLight,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text("ومشاهدتها بعد التقطيع والتغليف والتجهيز",
                    style: TextStyle(
                      fontFamily: 'black75',
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/2.3,
                      child: Image.asset("images/ready1.png",fit: BoxFit.fill,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/2.3,
                      child: Image.asset("images/ready2.png",fit: BoxFit.fill,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
            ],
          ),
        ),
      ),
    );
  }

}