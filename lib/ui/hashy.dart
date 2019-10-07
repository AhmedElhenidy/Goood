import 'package:camel/DataBase/SqliteDataBase.dart';
import 'package:camel/DataBase/config.dart';
import 'package:camel/statics/DataBaseConstants.dart';
import 'package:camel/statics/app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:camel/statics/snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

class Hashy extends StatefulWidget {
  int id;
  Hashy(this.id);
  _HashyState createState() => _HashyState();
}

class _HashyState extends State<Hashy> {
  int _current, kg = 0, number = 1;
  double sizeAnimatedWidth = 2;
  String sizeValue = "", headValue = "", cuttingValue = "", taghleefValue = "";
  bool mafroomTapped = false;
  double mafroomWidth = 0;
  FixedExtentScrollController scr;
  GlobalKey<ScaffoldState> _scaffoldKeyProfile;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile = new GlobalKey<ScaffoldState>();
    scr = FixedExtentScrollController();
    getProduct();
  }

  Map<String, dynamic> product = new Map();
  bool getProductCall = true;
  getProduct() async {
    setState(() {
      this.getProductCall = true;
    });
    final response = await db.select(
        table: DataBaseConstants.PRODUCT_TABLE,
        where: "${DataBaseConstants.PRODUCT_TABLE_ID} = ${widget.id}",
        limit: 1);
    setState(() {
      product = response[0];
      print("product choosen : : ${this.product}");
      this.getProductCall = false;
    });
  }

  int count = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    this.getShoppingCartCount();
  }

  void getShoppingCartCount() {
    SqlLiteDataBase.getShoppingCartCount().then((count) {
      setState(() {
        this.count = count;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKeyProfile,
      appBar: AppBarClass()
          .appBar(context, _scaffoldKeyProfile, false, count, title: "الحاشى"),
      backgroundColor: Colors.white,
      body: this.getProductCall
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 130),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                        child: Image.asset(
                          product[DataBaseConstants.PRODUCT_TABLE_IMAGE],
                          fit: BoxFit.fill,
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
                                Text(
                                  product[DataBaseConstants.PRODUCT_TABLE_NAME],
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: GoodColors.brown,
                                    fontFamily: 'black75',
                                  ),
                                ),
                                LikeButton(
                                  circleColor: CircleColor(
                                      start: Colors.white,
                                      end: GoodColors.brown),
                                  likeBuilder: (widget) {
                                    return Container(
                                      child: !widget
                                          ? Icon(
                                              Icons.favorite_border,
                                              color: GoodColors.brownLight,
                                            )
                                          : Icon(
                                              Icons.favorite,
                                              color: GoodColors.brown,
                                            ),
                                    );
                                  },
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
                                  padding: EdgeInsets.only(top: 16),
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: GoodColors.brownLight,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.attach_money,
                                            color: GoodColors.brownDark,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          height: 30,
                                          child: Center(
                                            child: Text(
                                              " السعر  ${this.product[DataBaseConstants.PRODUCT_TABLE_PRICE]} رس ",
                                              style: TextStyle(
                                                  fontFamily: 'bold65',
                                                  color: GoodColors.brownDark),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                bottomLeft: Radius.circular(8),
                                              ),
                                              border: Border.all(
                                                color: GoodColors.grey,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            widget.id == 4
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16.0, left: 8),
                                          child: cuttingValue == ""
                                              ? Container(
                                                  padding: EdgeInsets.only(
                                                      top: 2,
                                                      bottom: 2,
                                                      left: 16,
                                                      right: 16),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                      color:
                                                          GoodColors.brownDark,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: InkWell(
                                                    onTap: cutting,
                                                    child: Center(
                                                      child: Text(
                                                        "التقطيع",
                                                        style: TextStyle(
                                                          color: GoodColors
                                                              .brownDark,
                                                          fontSize: 18,
                                                          fontFamily: 'bold65',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      7.5,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        GoodColors.brownLight,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Flexible(
                                                        flex: 1,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2,
                                                                  bottom: 2,
                                                                  left: 16,
                                                                  right: 16),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: GoodColors
                                                                .brownDark,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            border: Border.all(
                                                              color: GoodColors
                                                                  .brownDark,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            onTap: cutting,
                                                            child: Center(
                                                              child: Text(
                                                                "التقطيع",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 18,
                                                                  fontFamily:
                                                                      'bold65',
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
                                                            child: Text(
                                                              "$cuttingValue",
                                                              style: TextStyle(
                                                                  color: GoodColors
                                                                      .brownDark,
                                                                  fontFamily:
                                                                      'bold65',
                                                                  fontSize: cuttingValue ==
                                                                              "تفاصيل كبيرة" ||
                                                                          cuttingValue ==
                                                                              "تفاصيل صغيرة"
                                                                      ? 16
                                                                      : 16),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16.0, right: 8),
                                          child: taghleefValue == ""
                                              ? Container(
                                                  padding: EdgeInsets.only(
                                                      top: 2,
                                                      bottom: 2,
                                                      left: 16,
                                                      right: 16),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                      color:
                                                          GoodColors.brownDark,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: InkWell(
                                                    onTap: taghleef,
                                                    child: Center(
                                                      child: Text(
                                                        "التغليف",
                                                        style: TextStyle(
                                                          color: GoodColors
                                                              .brownDark,
                                                          fontSize: 18,
                                                          fontFamily: 'bold65',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      7.5,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        GoodColors.brownLight,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Flexible(
                                                        flex: 1,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2,
                                                                  bottom: 2,
                                                                  left: 16,
                                                                  right: 16),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: GoodColors
                                                                .brownDark,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            border: Border.all(
                                                              color: GoodColors
                                                                  .brownDark,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            onTap: taghleef,
                                                            child: Center(
                                                              child: Text(
                                                                "التغليف",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 18,
                                                                  fontFamily:
                                                                      'bold65',
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
                                                            child: Text(
                                                              "$taghleefValue",
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'bold65',
                                                                color: GoodColors
                                                                    .brownDark,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ],
                                  )
                                :
                                //الحجم
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 16.0),
                                        child: sizeValue == ""
                                            ? Container(
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: GoodColors.brownDark,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: InkWell(
                                                  onTap: () async {
                                                    size();
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      "الحجم",
                                                      style: TextStyle(
                                                        color: GoodColors
                                                            .brownDark,
                                                        fontSize: 18,
                                                        fontFamily: 'bold65',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    7.5,
                                                decoration: BoxDecoration(
                                                  color: GoodColors.brownLight,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Column(
                                                  children: <Widget>[
                                                    Flexible(
                                                      flex: 1,
                                                      child: Container(
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: GoodColors
                                                              .brownDark,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          border: Border.all(
                                                            color: GoodColors
                                                                .brownDark,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            size();
                                                          },
                                                          child: Center(
                                                            child: Text(
                                                              "الحجم",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'bold65',
                                                                fontSize: 18,
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
                                                          child: Text(
                                                            "$sizeValue",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'bold65',
                                                              color: GoodColors
                                                                  .brownDark,
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
                                        padding:
                                            const EdgeInsets.only(top: 16.0),
                                        child: cuttingValue == ""
                                            ? Container(
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: GoodColors.brownDark,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: InkWell(
                                                  onTap: cutting,
                                                  child: Center(
                                                    child: Text(
                                                      "التقطيع",
                                                      style: TextStyle(
                                                        color: GoodColors
                                                            .brownDark,
                                                        fontSize: 18,
                                                        fontFamily: 'bold65',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    7.5,
                                                decoration: BoxDecoration(
                                                  color: GoodColors.brownLight,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Column(
                                                  children: <Widget>[
                                                    Flexible(
                                                      flex: 1,
                                                      child: Container(
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: GoodColors
                                                              .brownDark,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          border: Border.all(
                                                            color: GoodColors
                                                                .brownDark,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        child: InkWell(
                                                          onTap: cutting,
                                                          child: Center(
                                                            child: Text(
                                                              "التقطيع",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'bold65',
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
                                                          child: Text(
                                                            "$cuttingValue",
                                                            style: TextStyle(
                                                                color: GoodColors
                                                                    .brownDark,
                                                                fontFamily:
                                                                    'bold65',
                                                                fontSize: cuttingValue ==
                                                                            "تفاصيل كبيرة" ||
                                                                        cuttingValue ==
                                                                            "تفاصيل صغيرة"
                                                                    ? 16
                                                                    : 16),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 16.0),
                                        child: taghleefValue == ""
                                            ? Container(
                                                width: 120,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: GoodColors.brownDark,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: InkWell(
                                                  onTap: taghleef,
                                                  child: Center(
                                                    child: Text(
                                                      "التغليف",
                                                      style: TextStyle(
                                                        color: GoodColors
                                                            .brownDark,
                                                        fontSize: 18,
                                                        fontFamily: 'bold65',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    7.5,
                                                decoration: BoxDecoration(
                                                  color: GoodColors.brownLight,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Column(
                                                  children: <Widget>[
                                                    Flexible(
                                                      flex: 1,
                                                      child: Container(
                                                        width: 120,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: GoodColors
                                                              .brownDark,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          border: Border.all(
                                                            color: GoodColors
                                                                .brownDark,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        child: InkWell(
                                                          onTap: taghleef,
                                                          child: Center(
                                                            child: Text(
                                                              "التغليف",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'bold65',
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
                                                          child: Text(
                                                            "$taghleefValue",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: GoodColors
                                                                  .brownDark,
                                                              fontFamily:
                                                                  'bold65',
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
                            widget.id == 4
                                ? Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 16.0),
                                        child: !mafroomTapped
                                            ? Container(
                                                padding: EdgeInsets.only(
                                                    top: 2,
                                                    bottom: 2,
                                                    left: 16,
                                                    right: 16),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: GoodColors.brownDark,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      mafroomTapped =
                                                          !mafroomTapped;
                                                      mafroomWidth =
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.2;
                                                    });
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      "عدد الكيلوات",
                                                      style: TextStyle(
                                                        color: GoodColors
                                                            .brownDark,
                                                        fontSize: 19,
                                                        fontFamily: 'bold65',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                width: mafroomWidth,
                                                decoration: BoxDecoration(
                                                  color: GoodColors.brownLight,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 3,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2,
                                                                  bottom: 2,
                                                                  left: 8,
                                                                  right: 8),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: GoodColors
                                                                .brownDark,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            border: Border.all(
                                                              color: GoodColors
                                                                  .brownDark,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                mafroomTapped =
                                                                    !mafroomTapped;
                                                                mafroomWidth =
                                                                    0;
                                                              });
                                                            },
                                                            child: Center(
                                                              child: Text(
                                                                "عدد الكيلوات",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 18,
                                                                  fontFamily:
                                                                      'bold65',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 8.0),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                            left: 16,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    kg++;
                                                                    if(widget.id == 4 )
                                                                    this.number = kg ;
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  child: Center(
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 16,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 8,
                                                                        right:
                                                                            8,
                                                                        top: 8,
                                                                        bottom:
                                                                            8),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7),
                                                                  border: Border
                                                                      .all(
                                                                    color: GoodColors
                                                                        .brownDark,
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    "$kg",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'bold65',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    if (kg > 1 )
                                                                      if(widget.id == 4 )
                                                                      kg--;

                                                                    this.number = kg ;
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  child: Center(
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 16,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                "ك.ج",
                                                                style: TextStyle(
                                                                    color: GoodColors
                                                                        .brown,
                                                                    fontFamily:
                                                                        'bold65',
                                                                    fontSize:
                                                                        16),
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
                                    ],
                                  )
                                :
                                //مفروم
                                Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 16.0),
                                        child: !mafroomTapped
                                            ? Container(
                                                padding: EdgeInsets.only(
                                                    top: 2,
                                                    bottom: 2,
                                                    left: 16,
                                                    right: 16),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: GoodColors.brownDark,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      mafroomTapped =
                                                          !mafroomTapped;
                                                      mafroomWidth =
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.2;
                                                    });
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      "مفروم",
                                                      style: TextStyle(
                                                        color: GoodColors
                                                            .brownDark,
                                                        fontFamily: 'bold65',
                                                        fontSize: 19,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                width: mafroomWidth,
                                                decoration: BoxDecoration(
                                                  color: GoodColors.brownLight,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 2,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2,
                                                                  bottom: 2,
                                                                  left: 8,
                                                                  right: 8),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: GoodColors
                                                                .brownDark,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            border: Border.all(
                                                              color: GoodColors
                                                                  .brownDark,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                mafroomTapped =
                                                                    !mafroomTapped;
                                                                mafroomWidth =
                                                                    0;
                                                              });
                                                            },
                                                            child: Center(
                                                              child: Text(
                                                                "مفروم",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'bold65',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 8.0),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                            left: 16,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    kg++;
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  child: Center(
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 16,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 8,
                                                                        right:
                                                                            8,
                                                                        top: 8,
                                                                        bottom:
                                                                            8),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7),
                                                                  border: Border
                                                                      .all(
                                                                    color: GoodColors
                                                                        .brownDark,
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    "$kg",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'bold65',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    if (kg > 0)
                                                                      kg--;
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  child: Center(
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 16,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                "ك.ج",
                                                                style: TextStyle(
                                                                    color: GoodColors
                                                                        .brown,
                                                                    fontFamily:
                                                                        'bold65',
                                                                    fontSize:
                                                                        16),
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
        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                decoration: BoxDecoration(
                  color: GoodColors.brownLight,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: <Widget>[
//                    Expanded(
//                      flex: 2,
//                      child: Container(
//                        decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(7),
//                          color: GoodColors.brown,
//                        ),
//                        child: Center(
//                          child: Text(
//                            "العدد",
//                            style: TextStyle(color: Colors.white),
//                          ),
//                        ),
//                      ),
//                    ),
                    widget.id == 4 ? Container():  Expanded(
                      flex: 1,
                      child: widget.id == 4 ? Container(): IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                        onPressed: () {
                          setState(() {
                            number++;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: widget.id == 4 ? 3 : 1,
                      child:widget.id == 4 ? Container(
                          child: Center(
                            child: Text(
                              "يزيد 40 رس توصيل",
                              style: TextStyle(
                                fontFamily: 'bold65',
                                color: Colors.white,
                              ),
                            ),
                          )
                      ): Container(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        decoration: BoxDecoration(
                            color: GoodColors.brownDark,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: GoodColors.brownDark,
                            )),
                        child: Center(
                          child: Text(
                            "$number",
                            style: TextStyle(
                              fontFamily: 'bold65',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    widget.id == 4 ? Container(): Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 18,
                        ),
                        onPressed: () {
                          setState(() {
                            if (number > 1) number--;
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
                          child: Text(
                            "الإجمالى",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'bold65',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: GoodColors.brownDark,
                          ),
                          child: Center(
                            child: Text(
                              "${this.number * (this.product == null ? 0 : this.product[DataBaseConstants.PRODUCT_TABLE_PRICE]) + 40} رس",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'bold65',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  bool check = widget.id == 4 ? (
                      taghleefValue.isEmpty ||
                      cuttingValue.isEmpty) :(sizeValue.isEmpty ||
                      taghleefValue.isEmpty ||
                      cuttingValue.isEmpty) ;

                  if (check) {
                    print("not all Specification Specified ....");
                    Toast.show("من فضلك اضف الخصائص.. ", context,
                        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

                    // showInSnackBar("من فضلك اضف الخصائص.. " , context ,_scaffoldKeyProfile );
                  } else {
                    Map<String, String> specification = {
                      'التغليف': taghleefValue,
                      'التقطيع': cuttingValue,
                    };
                    if(widget.id != 4 ){
                      specification['الحجم'] = sizeValue ;
                    }
                    if (mafroomTapped && widget.id != 4 ) {
                      specification['مفروم'] = "$kg كجم ";
                    }
                    await SqlLiteDataBase.addToShoppingCart(
                        this.product[DataBaseConstants.PRODUCT_TABLE_ID],
                        this.number,
                        specification: specification);
                    Toast.show("تم اضافة المنتج بنجاح", context,
                        duration: Toast.LENGTH_LONG,
                        backgroundColor: Color(0xaa5eff00),
                        textColor: Colors.black);

                    this.getShoppingCartCount();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: GoodColors.brownDark,
                  ),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "إضافة الى السلة  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'bold65',
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ],
                  ),
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

  size() async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height / 3.0,
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      color: GoodColors.brownDark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Container(
                            child: Center(
                              child: Text(
                                "الحجم",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'bold65',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: GoodColors.brown),
                                  child: Center(
                                    child: Text(
                                      "تم",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'bold65',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                        sizeAnimatedWidth = 200;
                        switch (i) {
                          case 0:
                            sizeValue = "";
                            sizeAnimatedWidth = 0;
                            break;
                          case 1:
                            sizeValue = "صغير";
                            break;
                          case 2:
                            sizeValue = "متوسط";
                            break;
                          case 3:
                            sizeValue = "كبير";
                            break;
                          case 4:
                            sizeValue = "جبر";
                            break;
                          default:
                            sizeValue = "";
                        }
                      });
                    },
                    backgroundColor: CupertinoColors.white,
                    itemExtent: 60,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "اخنر الحجم",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 18,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "صغير",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 16,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "متوسط",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 16,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "كبير",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 16,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "جبر",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 16,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  cutting() async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: Text(
                              "التقطيع",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'bold65',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: GoodColors.brown),
                                  child: Center(
                                    child: Text(
                                      "تم",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'bold65',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: CupertinoPicker(
                    scrollController: scr,
                    onSelectedItemChanged: (int i) {
                      setState(() {
                        switch (i) {
                          case 0:
                            cuttingValue = "";
                            break;
                          case 1:
                            cuttingValue = "ثلاجة";
                            break;
                          case 2:
                            cuttingValue = "تفاصيل صغيرة";
                            break;
                          case 3:
                            cuttingValue = "تفاصيل كبيرة";
                            break;
                          case 4:
                            cuttingValue = "أرباع";
                            break;
                          case 5:
                            cuttingValue = "أنصاف";
                            break;
                          case 6:
                            cuttingValue = "كامل";
                            break;
                          case 7:
                            cuttingValue = "مفطع";
                            break;
                          default:
                            cuttingValue = "";
                        }
                      });
                    },
                    backgroundColor: CupertinoColors.white,
                    itemExtent: 70,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "اختر التقطيع",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 18,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "ثلاجة",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 16,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "تفاصيل صغيرة",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 16,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "تفاصيل كبيرة",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 16,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "أرباع",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 16,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "أنصاف",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 16,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "كامل",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 16,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "مفطع",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 16,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  taghleef() async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: Text(
                              "التغليف",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'bold65',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: GoodColors.brown),
                                  child: Center(
                                    child: Text(
                                      "تم",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'bold65',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: CupertinoPicker(
                    scrollController: scr,
                    onSelectedItemChanged: (int i) {
                      setState(() {
                        switch (i) {
                          case 0:
                            taghleefValue = "";
                            break;
                          case 1:
                            taghleefValue = "سحب حرارى هواء";
                            break;
                          case 2:
                            taghleefValue = "صحون مغلفة";
                            break;
                          case 3:
                            taghleefValue = "بدون";
                            break;
                          default:
                            taghleefValue = "";
                        }
                      });
                    },
                    backgroundColor: CupertinoColors.white,
                    itemExtent: 70,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "اختر التغليف",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 18,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "سحب حرارى هواء",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 16,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "صحون مغلفة",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 16,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "بدون",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 16,
                            fontFamily: 'bold65',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
