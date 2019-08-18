import 'package:camel/statics/app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
class BuySlices extends StatefulWidget{
  _BuySlicesState createState()=> _BuySlicesState();
}
class _BuySlicesState extends State<BuySlices>{
  int _current=0,kg=0;
  double mafroomWidth=0,sizewidthAnimated=0;
  double sizeHieghtAnimated=0;
  bool mafroomTapped =false ,sizeTapped=false,headTapped=false,
      cuttingTapped=false,taghleefTapped=false;
  //الحجم
  bool large =false,small=false,medium=true,gabr=false;
  //الرأس والكارعين
  bool mashloot=true,maslookh=false;
  //التقطيع
  bool fridge =true,smallpiece=false,largepiece=false,
  quarter=false,half=false,full=false,mfta=false;
  GlobalKey<ScaffoldState> _scaffoldKeyProfile;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile = new GlobalKey<ScaffoldState>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBarClass().appBar(context, _scaffoldKeyProfile,false),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom:130.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2.8,
                  child: CarouselSlider(
                    items: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset("images/caro1.png",fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset("images/caro2.png",fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset("images/caro3.png",fit: BoxFit.fill,
                        ),
                      ),
                    ],
                    aspectRatio: 16/9,
                    viewportFraction: 1.9,
                    initialPage: 0,
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.horizontal,
                    pauseAutoPlayOnTouch: Duration(seconds: 5),
                    onPageChanged: (index) {
                      setState(() {
                        _current = index;
                        print("_current : : $_current");
                      });
                    },
                  ),
                ),
            _current==0 ? Container(
                  padding: EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      //نعيمى
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("نعيمي",
                            style: TextStyle(
                              fontSize: 28,
                              color: GoodColors.brown,
                            ),
                          ),
                          LikeButton(
                            size: 35,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 3,
                            width: 30,
                            color: GoodColors.brownDark,
                          ),
                        ],
                      ),
                      //السعر
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top :16),
                            width: 200,
                            child: Row(
                              children: <Widget>[
                                Expanded(flex: 1,
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: GoodColors.brownLight,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight:Radius.circular(8),
                                      ),
                                    ),
                                    child: Icon(Icons.attach_money,
                                      color: GoodColors.brownDark,
                                    ),
                                  ),
                                ),
                                Expanded(flex: 3,
                                  child: Container(
                                    height: 30,
                                    child: Center(child: Text(
                                        "السعر 150 رس",
                                      style: TextStyle(
                                        color: GoodColors.brownDark
                                      ),
                                    ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                         bottomLeft:Radius.circular(8),
                                      ),
                                      border: Border.all(
                                        color: GoodColors.grey,
                                      )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //الحجم
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top :16.0),
                            child: Stack(
                              children: <Widget>[
                                sizeTapped?AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  width: sizewidthAnimated,
                                  height: sizeHieghtAnimated,
                                  child: Column(
                                    children: <Widget>[
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              sizeHieghtAnimated=0;
                                              sizewidthAnimated=0;
                                              sizeTapped=false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: GoodColors.brownDark,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("الحجم",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              small=true;
                                              large=false;
                                              medium=false;
                                              gabr=false;
                                            });
                                            },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: small?GoodColors.brownLight:Colors.white,
                                              border: Border(
                                                bottom: BorderSide(color: GoodColors.grey),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("صغير",
                                                style: TextStyle(
                                                  color: GoodColors.brown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              small=false;
                                              large=false;
                                              medium=true;
                                              gabr=false;
                                            });
                                          },
                                          child: Container(

                                            decoration: BoxDecoration(
                                              color: medium?GoodColors.brownLight:Colors.white,
                                              border: Border(
                                                bottom: BorderSide(color: GoodColors.grey),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("متوسط",
                                                style: TextStyle(
                                                  color: GoodColors.brown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              small=false;
                                              large=true;
                                              medium=false;
                                              gabr=false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: large?GoodColors.brownLight:Colors.white,
                                              border: Border(
                                                bottom: BorderSide(color: GoodColors.grey),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("كبير",
                                                style: TextStyle(
                                                  color: GoodColors.brown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              small=false;
                                              large=false;
                                              medium=false;
                                              gabr=true;
                                            });
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: gabr?GoodColors.brownLight:Colors.white,
                                                border: Border(
                                                  bottom: BorderSide(color: GoodColors.grey),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text("جبر",
                                                  style: TextStyle(
                                                    color: GoodColors.brown,
                                                  ),
                                                ),
                                              ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                    :headTapped?AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  width: sizewidthAnimated,
                                  height: sizeHieghtAnimated-100,
                                  child: Column(
                                    children: <Widget>[
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              sizeHieghtAnimated=0;
                                              sizewidthAnimated=0;
                                              headTapped=false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: GoodColors.brownDark,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("الرأس والكارعين",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              mashloot=true;
                                              maslookh=false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: mashloot?GoodColors.brownLight:Colors.white,
                                              border: Border(
                                                bottom: BorderSide(color: GoodColors.grey),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("مشلوطة",
                                                style: TextStyle(
                                                  color: GoodColors.brown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              mashloot=false;
                                              maslookh=true;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: maslookh?GoodColors.brownLight:Colors.white,
                                              border: Border(
                                                bottom: BorderSide(color: GoodColors.grey),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("مسلوخ",
                                                style: TextStyle(
                                                  color: GoodColors.brown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                :cuttingTapped?AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  width: sizewidthAnimated,
                                  height: sizeHieghtAnimated+200,
                                  child: Column(
                                    children: <Widget>[
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              sizeHieghtAnimated=0;
                                              sizewidthAnimated=0;
                                              cuttingTapped=false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: GoodColors.brownDark,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("التقطيع",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              fridge =true;
                                              smallpiece=false;
                                              largepiece=false;
                                              quarter=false;
                                              half=false;
                                              full=false;
                                              mfta=false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: fridge?GoodColors.brownLight:Colors.white,
                                              border: Border(
                                                bottom: BorderSide(color: GoodColors.grey),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("ثلاجة",
                                                style: TextStyle(
                                                  color: GoodColors.brown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              fridge =false;
                                              smallpiece=true;
                                              largepiece=false;
                                              quarter=false;
                                              half=false;
                                              full=false;
                                              mfta=false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: smallpiece?GoodColors.brownLight:Colors.white,
                                              border: Border(
                                                bottom: BorderSide(color: GoodColors.grey),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("تفاصيل صغيره",
                                                style: TextStyle(
                                                  color: GoodColors.brown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              fridge =false;
                                              smallpiece=false;
                                              largepiece=true;
                                              quarter=false;
                                              half=false;
                                              full=false;
                                              mfta=false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: largepiece?GoodColors.brownLight:Colors.white,
                                              border: Border(
                                                bottom: BorderSide(color: GoodColors.grey),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("تفاصيل كبيرة",
                                                style: TextStyle(
                                                  color: GoodColors.brown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              fridge =false;
                                              smallpiece=false;
                                              largepiece=false;
                                              quarter=true;
                                              half=false;
                                              full=false;
                                              mfta=false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: quarter?GoodColors.brownLight:Colors.white,
                                              border: Border(
                                                bottom: BorderSide(color: GoodColors.grey),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("أرباع",
                                                style: TextStyle(
                                                  color: GoodColors.brown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              fridge =false;
                                              smallpiece=false;
                                              largepiece=false;
                                              quarter=false;
                                              half=true;
                                              full=false;
                                              mfta=false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: half?GoodColors.brownLight:Colors.white,
                                              border: Border(
                                                bottom: BorderSide(color: GoodColors.grey),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("أنصاف",
                                                style: TextStyle(
                                                  color: GoodColors.brown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              fridge =false;
                                              smallpiece=false;
                                              largepiece=false;
                                              quarter=false;
                                              half=false;
                                              full=true;
                                              mfta=false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: full?GoodColors.brownLight:Colors.white,
                                              border: Border(
                                                bottom: BorderSide(color: GoodColors.grey),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("كامل",
                                                style: TextStyle(
                                                  color: GoodColors.brown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              fridge =false;
                                              smallpiece=false;
                                              largepiece=false;
                                              quarter=false;
                                              half=false;
                                              full=false;
                                              mfta=true;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: mfta?GoodColors.brownLight:Colors.white,
                                              border: Border(
                                                bottom: BorderSide(color: GoodColors.grey),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("مفطح",
                                                style: TextStyle(
                                                  color: GoodColors.brown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                :taghleefTapped?AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  width: sizewidthAnimated,
                                  height: sizeHieghtAnimated,
                                  child: Column(
                                    children: <Widget>[
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              sizeHieghtAnimated=0;
                                              sizewidthAnimated=0;
                                              taghleefTapped=false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: GoodColors.brownDark,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("التغليف",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              small=true;
                                              large=false;
                                              medium=false;
                                              gabr=false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: small?GoodColors.brownLight:Colors.white,
                                              border: Border(
                                                bottom: BorderSide(color: GoodColors.grey),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("حرارى سحب هواء",
                                                style: TextStyle(
                                                  color: GoodColors.brown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              small=false;
                                              large=false;
                                              medium=true;
                                              gabr=false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: medium?GoodColors.brownLight:Colors.white,
                                              border: Border(
                                                bottom: BorderSide(color: GoodColors.grey),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("صحون مغلفة",
                                                style: TextStyle(
                                                  color: GoodColors.brown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              small=false;
                                              large=true;
                                              medium=false;
                                              gabr=false;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: large?GoodColors.brownLight:Colors.white,
                                              border: Border(
                                                bottom: BorderSide(color: GoodColors.grey),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("بدون",
                                                style: TextStyle(
                                                  color: GoodColors.brown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                :Container(),

                                Container(
                                  padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: GoodColors.brownDark,
                                      width: 2,
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        sizeTapped=true;
                                        taghleefTapped=false;
                                        cuttingTapped=false;
                                        headTapped=false;
                                        sizeHieghtAnimated=MediaQuery.of(context).size.height/2.5;
                                        sizewidthAnimated=MediaQuery.of(context).size.width/1.12;
                                      });
                                    },
                                    child: Center(
                                      child: Text("الحجم",
                                        style: TextStyle(
                                          color: GoodColors.brownDark,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // الرأس والكارعين و التقطيع والتغليف
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top :16.0),
                            child: Container(
                              padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: GoodColors.brownDark,
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    headTapped=true;
                                    taghleefTapped=false;
                                    cuttingTapped=false;
                                    sizeTapped=false;
                                    sizeHieghtAnimated=MediaQuery.of(context).size.height/2.5;
                                    sizewidthAnimated=MediaQuery.of(context).size.width/1.12;
                                  });
                                },
                                child: Center(
                                  child: Text("الرأس والكارعين",
                                    style: TextStyle(
                                      color: GoodColors.brownDark,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top :16.0),
                            child: Container(
                              padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: GoodColors.brownDark,
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    cuttingTapped=true;
                                    taghleefTapped=false;
                                    headTapped=false;
                                    sizeTapped=false;
                                    sizeHieghtAnimated=MediaQuery.of(context).size.height/2.5;
                                    sizewidthAnimated=MediaQuery.of(context).size.width/1.12;
                                  });
                                },
                                child: Center(
                                  child: Text("التقطيع",
                                    style: TextStyle(
                                      color: GoodColors.brownDark,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top :16.0),
                            child: Container(
                              padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: GoodColors.brownDark,
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    taghleefTapped=true;
                                    cuttingTapped=false;
                                    headTapped=false;
                                    sizeTapped=false;
                                    sizeHieghtAnimated=MediaQuery.of(context).size.height/2.5;
                                    sizewidthAnimated=MediaQuery.of(context).size.width/1.12;
                                  });
                                },
                                child: Center(
                                  child: Text("التغليف",
                                    style: TextStyle(
                                      color: GoodColors.brownDark,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //مفروم
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top :16.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width/1.25,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    right: 0,top: 1,bottom: 1,
                                    child: AnimatedContainer(
                                      padding: EdgeInsets.only(right: 100),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: GoodColors.brownLight,
                                      ),
                                      height: 30,
                                      width: mafroomTapped?mafroomWidth:0,
                                      duration: Duration(milliseconds: 500),
                                      child: Row(
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(Icons.add,color: Colors.white,),
                                            onPressed: (){
                                              setState(() {
                                                kg++;
                                              });
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:4.0,bottom:4),
                                            child: Container(
                                              padding: EdgeInsets.only(left: 12,right: 12),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(7),
                                                border: Border.all(
                                                  color: GoodColors.brownDark,
                                                )
                                              ),
                                              child: Center(
                                                child: Text("$kg"),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.remove,color: Colors.white,),
                                            onPressed: (){
                                              setState(() {
                                                kg--;
                                              });
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:8.0),
                                            child: Text("ك.ج"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100,height: 45,
                                    padding: EdgeInsets.only(left: 16,right: 16),
                                    decoration: BoxDecoration(
                                      color: mafroomTapped?GoodColors.brownDark:Color(0xffffff),
                                      borderRadius: BorderRadius.circular(18),
                                      border: Border.all(
                                        color: GoodColors.brownDark,
                                        width: 2,
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: (){
                                        setState(() {
                                          mafroomWidth=400;
                                          mafroomTapped=!mafroomTapped;
                                        });
                                      },
                                      child: Center(
                                        child: Text("مفروم",
                                          style: TextStyle(
                                            color: mafroomTapped?Colors.white:GoodColors.brownDark,
                                            fontSize: 19,
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
                    ],
                  ),
                )
                :_current==1 ? Container(
                  padding: EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.yellow,
                  child: Column(
                    children: <Widget>[
                      //نعيمى
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("حوار",
                            style: TextStyle(
                              fontSize: 28,
                              color: GoodColors.brown,
                            ),
                          ),
                          LikeButton(
                            size: 40,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 3,
                            width: 30,
                            color: GoodColors.brownDark,
                          ),
                        ],
                      ),
                      //السعر
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top :16),
                            width: 200,
                            child: Row(
                              children: <Widget>[
                                Expanded(flex: 1,
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: GoodColors.brownLight,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight:Radius.circular(8),
                                      ),
                                    ),
                                    child: Icon(Icons.attach_money,
                                      color: GoodColors.brownDark,
                                    ),
                                  ),
                                ),
                                Expanded(flex: 3,
                                  child: Container(
                                    height: 30,
                                    child: Center(child: Text(
                                      "السعر 150 رس",
                                      style: TextStyle(
                                          color: GoodColors.brownDark
                                      ),
                                    ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft:Radius.circular(8),
                                        ),
                                        border: Border.all(
                                          color: GoodColors.grey,
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // الحجم و التقطيع والتغليف
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top :16.0),
                            child: Container(
                              padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: GoodColors.brownDark,
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                child: Center(
                                  child: Text("الحجم",
                                    style: TextStyle(
                                      color: GoodColors.brownDark,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top :16.0),
                            child: Container(
                              padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: GoodColors.brownDark,
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                child: Center(
                                  child: Text("التقطيع",
                                    style: TextStyle(
                                      color: GoodColors.brownDark,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top :16.0),
                            child: Container(
                              padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: GoodColors.brownDark,
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                child: Center(
                                  child: Text("التغليف",
                                    style: TextStyle(
                                      color: GoodColors.brownDark,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //مفروم
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top :16.0),
                            child: Container(
                              padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: GoodColors.brownDark,
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                child: Center(
                                  child: Text("مفروم",
                                    style: TextStyle(
                                      color: GoodColors.brownDark,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                :_current==2? Container(
                  padding: EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: Column(
                      children: <Widget>[
                    //نعيمى
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("لحم الحاشى",
                          style: TextStyle(
                            fontSize: 28,
                            color: GoodColors.brown,
                          ),
                        ),
                        LikeButton(
                          size: 40,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 3,
                          width: 30,
                          color: GoodColors.brownDark,
                        ),
                      ],
                    ),
                    //السعر
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top :16),
                          width: 200,
                          child: Row(
                            children: <Widget>[
                              Expanded(flex: 1,
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: GoodColors.brownLight,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomRight:Radius.circular(8),
                                    ),
                                  ),
                                  child: Icon(Icons.attach_money,
                                    color: GoodColors.brownDark,
                                  ),
                                ),
                              ),
                              Expanded(flex: 3,
                                child: Container(
                                  height: 30,
                                  child: Center(child: Text(
                                    "السعر 150 رس",
                                    style: TextStyle(
                                        color: GoodColors.brownDark
                                    ),
                                  ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft:Radius.circular(8),
                                      ),
                                      border: Border.all(
                                        color: GoodColors.grey,
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //  التقطيع والتغليف
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top :16.0,left: 16),
                          child: Container(
                            padding: EdgeInsets.only(top :4,bottom: 4,left: 32,right: 32),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: GoodColors.brownDark,
                                width: 2,
                              ),
                            ),
                            child: InkWell(
                              child: Center(
                                child: Text("التقطيع",
                                  style: TextStyle(
                                    color: GoodColors.brownDark,
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top :16.0,right: 16),
                          child: Container(
                            padding: EdgeInsets.only(top :4,bottom: 4,left: 32,right: 32),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: GoodColors.brownDark,
                                width: 2,
                              ),
                            ),
                            child: InkWell(
                              child: Center(
                                child: Text("التغليف",
                                  style: TextStyle(
                                    color: GoodColors.brownDark,
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
            ):
                Container(),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left :16.0,right: 16,bottom: 16),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(height: 50,
                padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 8),
                decoration: BoxDecoration(
                  color: GoodColors.brownLight,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: GoodColors.brown,
                        ),
                        child: Center(
                          child: Text("العدد",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.add,color: Colors.white,size: 18,),
                        onPressed: (){
                          setState(() {
                            kg++;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(left: 8,right: 8),
                        decoration: BoxDecoration(
                            color: GoodColors.brownDark,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: GoodColors.brownDark,
                            )
                        ),
                        child: Center(
                          child: Text("$kg",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.remove,color: Colors.white,size: 18,),
                        onPressed: (){
                          setState(() {
                            kg--;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: GoodColors.brown,
                        ),
                        child: Center(
                          child: Text("الإجمالى",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: GoodColors.brownDark,
                          ),
                          child: Center(
                            child: Text("150 رس",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: GoodColors.brownDark,
                ),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("إضافة الى السلة  ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Icon(Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          height: 100,
        ),
      ),
    );
  }
}