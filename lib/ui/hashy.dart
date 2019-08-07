import 'package:camel/statics/app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter/cupertino.dart';
class Hashy extends StatefulWidget{
  _HashyState createState()=> _HashyState();
}
class _HashyState extends State<Hashy>{
  int _current,kg=1,number=1;
  double sizeAnimatedWidth =2;
  String sizeValue ="",headValue="",cuttingValue="",taghleefValue="";
  bool mafroomTapped =false; double mafroomWidth=0;
  FixedExtentScrollController scr;
  GlobalKey<ScaffoldState> _scaffoldKeyProfile;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile = new GlobalKey<ScaffoldState>();
    scr = FixedExtentScrollController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBarClass().appBar(context,_scaffoldKeyProfile),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 130),
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
                        child: Image.asset("images/hashy.png",fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset("images/hashy.png",fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset("images/hashy.png",fit: BoxFit.fill,
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
                Container(
                  padding: EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      //نعيمى
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("الحاشى",
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
                            child: sizeAnimatedWidth<3 ?Container(
                              padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: GoodColors.brownDark,
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                onTap: ()async{
                                  size();
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
                            )
                                :AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: sizeAnimatedWidth,
                              decoration: BoxDecoration(
                                color: GoodColors.brownLight,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:Row(
                                children: <Widget>[
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    width: sizeAnimatedWidth/2,
                                    padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                                    decoration: BoxDecoration(
                                      color: GoodColors.brownDark,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: GoodColors.brownDark,
                                        width: 2,
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: ()async{
                                        size();
                                      },
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
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    width: sizeAnimatedWidth/2,
                                    child: Center(
                                      child: Text("$sizeValue",
                                        style: TextStyle(
                                          color: GoodColors.brownDark,
                                          fontSize: 18,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top :16.0),
                            child: headValue==""?Container(
                              padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: GoodColors.brownDark,
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                onTap: ()async{
                                  size();
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
                            ): Container(
                              height: MediaQuery.of(context).size.height/7.5,
                              decoration: BoxDecoration(
                                color: GoodColors.brownLight,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:Column(
                                children: <Widget>[
                                  Flexible(
                                    flex:1,
                                    child: Container(
                                      padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                                      decoration: BoxDecoration(
                                        color: GoodColors.brownDark,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: GoodColors.brownDark,
                                          width: 2,
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: ()async{
                                          size();
                                        },
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
                                    child: Container(
                                      child: Center(
                                        child: Text("$headValue",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: GoodColors.brownDark,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top :16.0),
                            child: cuttingValue=="" ?Container(
                              padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: GoodColors.brownDark,
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                onTap: cutting,
                                child: Center(
                                  child: Text("التقطيع",
                                    style: TextStyle(
                                      color: GoodColors.brownDark,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ),
                            ):Container(
                              height: MediaQuery.of(context).size.height/7.5,
                              decoration: BoxDecoration(
                                color: GoodColors.brownLight,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Flexible(
                                    flex:1,
                                    child: Container(
                                      padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                                      decoration: BoxDecoration(
                                        color: GoodColors.brownDark,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: GoodColors.brownDark,
                                          width: 2,
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: cutting,
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
                                    child: Container(
                                      child: Center(
                                        child: Text("$cuttingValue",
                                          style: TextStyle(
                                              color: GoodColors.brownDark,
                                              fontSize: cuttingValue=="تفاصيل كبيرة"||cuttingValue=="تفاصيل صغيرة"?16:19
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top :16.0),
                            child: taghleefValue==""?Container(
                              padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: GoodColors.brownDark,
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                onTap: taghleef,
                                child: Center(
                                  child: Text("التغليف",
                                    style: TextStyle(
                                      color: GoodColors.brownDark,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ),
                            ):Container(
                              height: MediaQuery.of(context).size.height/7.5,
                              decoration: BoxDecoration(
                                color: GoodColors.brownLight,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Flexible(
                                    flex:1,
                                    child: Container(
                                      padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                                      decoration: BoxDecoration(
                                        color: GoodColors.brownDark,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: GoodColors.brownDark,
                                          width: 2,
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: taghleef,
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
                                    child: Container(
                                      child: Center(
                                        child: Text("$taghleefValue",
                                          style: TextStyle(
                                            fontSize: 19,
                                            color: GoodColors.brownDark,
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
                      //مفروم
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top :16.0),
                            child:!mafroomTapped?Container(
                              padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: GoodColors.brownDark,
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    mafroomTapped=!mafroomTapped;
                                    mafroomWidth=300;
                                  });
                                },
                                child: Center(
                                  child: Text("مفروم",
                                    style: TextStyle(
                                      color: GoodColors.brownDark,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ),
                            )
                                : AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: mafroomWidth,
                              decoration: BoxDecoration(
                                color: GoodColors.brownLight,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex:1,
                                    child: Container(
                                      padding: EdgeInsets.only(top :4,bottom: 4,left: 16,right: 16),
                                      decoration: BoxDecoration(
                                        color: GoodColors.brownDark,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: GoodColors.brownDark,
                                          width: 2,
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: (){
                                          setState(() {
                                            mafroomTapped=!mafroomTapped;
                                            mafroomWidth=0;
                                          });
                                        },
                                        child: Center(
                                          child: Text("مفروم",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 19,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 4,right: 4),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          InkWell(
                                            onTap: (){
                                              setState(() {
                                                kg++;
                                              });
                                            },
                                            child: Container(
                                              child: Center(
                                                child:Icon(Icons.add,color: Colors.white,size: 20,) ,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(7),
                                              border: Border.all(
                                                color: GoodColors.brownDark,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("$kg"),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              setState(() {
                                                if(kg>1)
                                                  kg--;
                                              });
                                            },
                                            child: Container(
                                              child: Center(
                                                child:Icon(Icons.remove,color: Colors.white,size: 20,) ,
                                              ),
                                            ),
                                          ),
                                          Text("ك.ج",
                                            style: TextStyle(
                                                color: GoodColors.brown,
                                                fontSize: 18
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
                        ],
                      ),
                    ],
                  ),
                ),
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
                            number++;
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
                          child: Text("$number",
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
                            if(number>1)
                              number--;
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
  size () async {
    await showCupertinoModalPopup <void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery
              .of(context)
              .size
              .height / 2.7,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
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
              Flexible(
                flex: 3,
                child: CupertinoPicker(
                  scrollController: scr,
                  onSelectedItemChanged: (int i) {
                    print(i);
                    setState(() {
                      sizeAnimatedWidth=200;
                      switch(i){
                        case 0:sizeValue ="";sizeAnimatedWidth=0;
                        break;
                        case 1:sizeValue ="صغير";
                        break;
                        case 2:sizeValue ="متوسط";
                        break;
                        case 3:sizeValue ="كبير";
                        break;
                        case 4:sizeValue ="جبر";
                        break;
                        default: sizeValue ="";
                      }
                    });
                  },
                  backgroundColor: CupertinoColors.white,
                  itemExtent: 70,
                  children: <Widget>[
                    Center(
                      child: Text("اخنر الحجم",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("صغير",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("متوسط",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("كبير",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("جبر",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  cutting () async {
    await showCupertinoModalPopup <void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery
              .of(context)
              .size
              .height / 2.7,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
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
              Flexible(
                flex: 3,
                child: CupertinoPicker(
                  scrollController: scr,
                  onSelectedItemChanged: (int i) {
                    setState(() {
                      switch(i){
                        case 0:cuttingValue ="";
                        break;
                        case 1:cuttingValue ="ثلاجة";
                        break;
                        case 2:cuttingValue ="تفاصيل سغيرة";
                        break;
                        case 3:cuttingValue ="تفاصيل كبيرة";
                        break;
                        case 4:cuttingValue ="أرباع";
                        break;
                        case 5:cuttingValue ="أنصاف";
                        break;
                        case 6:cuttingValue ="كامل";
                        break;
                        case 7:cuttingValue ="مفطع";
                        break;
                        default: cuttingValue ="";
                      }
                    });

                  },
                  backgroundColor: CupertinoColors.white,
                  itemExtent: 70,
                  children: <Widget>[
                    Center(
                      child: Text("اختر التقطيع",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("ثلاجة",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("تفاصيل صغيرة",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("تفاصيل كبيرة",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("أرباع",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("أنصاف",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("كامل",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("مفطع",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  taghleef () async {
    await showCupertinoModalPopup <void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery
              .of(context)
              .size
              .height / 2.7,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
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
              Flexible(
                flex: 3,
                child: CupertinoPicker(
                  scrollController: scr,
                  onSelectedItemChanged: (int i) {
                    setState(() {
                      switch(i){
                        case 0:taghleefValue ="";
                        break;
                        case 1:taghleefValue ="سحب حرارى هواء";
                        break;
                        case 2:taghleefValue ="صحون مغلفة";
                        break;
                        case 3:sizeValue ="بدون";
                        break;
                        default: sizeValue ="";
                      }
                    });
                  },
                  backgroundColor: CupertinoColors.white,
                  itemExtent: 70,
                  children: <Widget>[
                    Center(
                      child: Text("اختر التغليف",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("سحب حرارى هواء",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("صحون مغلفة",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("بدون",
                        style: TextStyle(
                          color: GoodColors.brown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
