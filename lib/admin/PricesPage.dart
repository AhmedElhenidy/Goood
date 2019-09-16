import 'package:camel/DataBase/config.dart';
import 'package:camel/admin/api/prices_api.dart';
import 'package:camel/admin/statics/admin_app_bar.dart';
import 'package:camel/statics/DataBaseConstants.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'model/product.dart';

class PricesPage extends StatefulWidget {
  PricesPage({Key key}) : super(key: key);
  @override
  _PricesPageState createState() {
    return _PricesPageState();
  }
}

class _PricesPageState extends State<PricesPage> {
  TextEditingController hor,
      lbany,
      mfrood,
      hashymeat,
      tisBalady,
      n3imy,
      hry,
      nagdy;
  List<ProductModel> priceList = new List();
  bool getAllPricesApiCall = false;
  GetAllPricesServerResponse response ;
  getAllPrices() {
    setState(() {
      getAllPricesApiCall = true;
    });
    PricesApi.getAllPrices().then((response) {
      this.response = response ;
      this.priceList = response.productList ;
      response.productList?.forEach((product) {
        switch (product.id) {
          case 1:
            setState(() {
              hor.text = product.price;
            });
            break;
          case 2:
            setState(() {
              lbany.text = product.price;
            });
            break;
          case 3:
            setState(() {
              mfrood.text = product.price;
            });
            break;
          case 4:
            setState(() {
              hashymeat.text = product.price;
            });
            break;
          case 5:
            setState(() {
              tisBalady.text = product.price;
            });
            break;
          case 6:
            setState(() {
              n3imy.text = product.price;
            });
            break;
          case 7:
            setState(() {
              hry.text = product.price;
            });
            break;
          case 8:
            setState(() {
              nagdy.text = product.price;
            });
            break;
        }
      });
      setState(() {
        getAllPricesApiCall = false;
      });
    }, onError: (error) {
      setState(() {
        getAllPricesApiCall = false;
      });
      print("get All promo error : : : $error");
    });
  }
  bool updateApiCall = false ;
  updatePrices(){
    setState(() {
      this.updateApiCall = true ;
    });
    PricesApi.updatePrices(getDataToSend()).then((response){
      setState(() {
        this.updateApiCall = false ;
      });
      this.getAllPrices();
    },onError: (error){
      print("update Prices error  : : $error");
      setState(() {
        this.updateApiCall = false ;
      });
    });

  }

  GetAllPricesServerResponse getDataToSend(){
    if(hor.toString().isEmpty || lbany.text.isEmpty || mfrood.text.isEmpty || hashymeat.text.isEmpty || tisBalady.text.isEmpty||n3imy.text.isEmpty||hry.text.isEmpty || nagdy.text.isEmpty)
      {
        Toast.show("من فضلك تاكد من ادخال جميع الاسعار", context , duration: Toast.LENGTH_LONG , );
        return null ;
      }
      priceList[0].price = hor.text ;
      priceList[1].price = lbany.text ;
      priceList[2].price = mfrood.text ;
      priceList[3].price = hashymeat.text ;
      priceList[4].price = tisBalady.text ;
      priceList[5].price = n3imy.text ;
      priceList[6].price = hry.text ;
      priceList[7].price = nagdy.text ;
     return new GetAllPricesServerResponse(
       productList: priceList
     );
  }


  GlobalKey<ScaffoldState> _scaffoldKeyProfile = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    hor = TextEditingController();
    lbany = TextEditingController();
    mfrood = TextEditingController();
    hashymeat = TextEditingController();
    tisBalady = TextEditingController();
    n3imy = TextEditingController();
    hry = TextEditingController();
    nagdy = TextEditingController();
    this.getAllPrices();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AdminAppBarClass().appBar(context, _scaffoldKeyProfile, "الاسعار"),
      body: getAllPricesApiCall
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: GoodColors.brownDark,
              ),
            )
          : SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Flexible(
                              child: Container(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.width /
                                              4.7,
                                      backgroundColor: Colors.white,
                                      child: Center(
                                        child: Image.asset("images/camel.png"),
                                      ),
                                    ),
                                    Center(
                                        child: Text(
                                      "قسم الحاشي",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: GoodColors.brownDark),
                                    ))
                                  ],
                                ),
                              ),
                              flex: 1,
                            ),
                            Flexible(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Flexible(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 16,
                                            right: 16),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  padding: EdgeInsets.all(3),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 2,
                                                            color: GoodColors
                                                                .brownDark),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            color: GoodColors
                                                                .brownDark,
                                                            child: Center(
                                                              child: Text(
                                                                'حور',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ),
                                                          ),
                                                          flex: 2,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 6,
                                                                    left: 5,
                                                                    right: 5),
                                                            child: TextField(
                                                              controller: hor,
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "السعر"),
                                                            ),
                                                          ),
                                                          flex: 2,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            color: GoodColors
                                                                .brownDark,
                                                            child: Center(
                                                              child: IconButton(
                                                                  icon: Icon(
                                                                    Icons.done,
                                                                    size: 17,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  onPressed:
                                                                      () {}),
                                                            ),
                                                          ),
                                                          flex: 1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  padding: EdgeInsets.all(3),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 2,
                                                            color: GoodColors
                                                                .brownDark),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            color: GoodColors
                                                                .brownDark,
                                                            child: Center(
                                                              child: Text(
                                                                'لبانى',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ),
                                                          ),
                                                          flex: 2,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 6,
                                                                    left: 5,
                                                                    right: 5),
                                                            child: TextField(
                                                              controller: lbany,
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "السعر"),
                                                            ),
                                                          ),
                                                          flex: 2,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            color: GoodColors
                                                                .brownDark,
                                                            child: Center(
                                                              child: IconButton(
                                                                  icon: Icon(
                                                                    Icons.done,
                                                                    size: 17,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  onPressed:
                                                                      () {}),
                                                            ),
                                                          ),
                                                          flex: 1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              flex: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      flex: 1,
                                    ),
                                    Flexible(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 16,
                                            right: 16),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  padding: EdgeInsets.all(3),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 2,
                                                            color: GoodColors
                                                                .brownDark),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            color: GoodColors
                                                                .brownDark,
                                                            child: Center(
                                                              child: Text(
                                                                'مفرود',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ),
                                                          ),
                                                          flex: 2,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 6,
                                                                    left: 5,
                                                                    right: 5),
                                                            child: TextField(
                                                              controller:
                                                                  mfrood,
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "السعر"),
                                                            ),
                                                          ),
                                                          flex: 2,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            color: GoodColors
                                                                .brownDark,
                                                            child: Center(
                                                              child: IconButton(
                                                                  icon: Icon(
                                                                    Icons.done,
                                                                    size: 17,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  onPressed:
                                                                      () {}),
                                                            ),
                                                          ),
                                                          flex: 1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  padding: EdgeInsets.all(3),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 2,
                                                            color: GoodColors
                                                                .brownDark),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            color: GoodColors
                                                                .brownDark,
                                                            child: Center(
                                                              child: Text(
                                                                'لحم حاشى',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ),
                                                          ),
                                                          flex: 2,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 6,
                                                                    left: 5,
                                                                    right: 5),
                                                            child: TextField(
                                                              controller:
                                                                  hashymeat,
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "السعر"),
                                                            ),
                                                          ),
                                                          flex: 2,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            color: GoodColors
                                                                .brownDark,
                                                            child: Center(
                                                              child: IconButton(
                                                                  icon: Icon(
                                                                    Icons.done,
                                                                    size: 17,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  onPressed:
                                                                      () {}),
                                                            ),
                                                          ),
                                                          flex: 1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              flex: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ),
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                      flex: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16.0, right: 16, left: 16),
                      child: Divider(
                        height: 3,
                        color: GoodColors.brownDark,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Flexible(
                              child: Container(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.width /
                                              4.7,
                                      backgroundColor: Colors.white,
                                      child: Center(
                                        child: Image.asset("images/camel.png"),
                                      ),
                                    ),
                                    Center(
                                        child: Text(
                                      "قسم الذيائح",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: GoodColors.brownDark),
                                    ))
                                  ],
                                ),
                              ),
                              flex: 1,
                            ),
                            Flexible(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Flexible(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 16,
                                            right: 16),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  padding: EdgeInsets.all(3),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 2,
                                                            color: GoodColors
                                                                .brownDark),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            color: GoodColors
                                                                .brownDark,
                                                            child: Center(
                                                              child: Text(
                                                                'تيس بلدى',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ),
                                                          ),
                                                          flex: 2,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 6,
                                                                    left: 5,
                                                                    right: 5),
                                                            child: TextField(
                                                              controller:
                                                                  tisBalady,
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "السعر"),
                                                            ),
                                                          ),
                                                          flex: 2,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            color: GoodColors
                                                                .brownDark,
                                                            child: Center(
                                                              child: IconButton(
                                                                  icon: Icon(
                                                                    Icons.done,
                                                                    size: 17,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  onPressed:
                                                                      () {}),
                                                            ),
                                                          ),
                                                          flex: 1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  padding: EdgeInsets.all(3),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 2,
                                                            color: GoodColors
                                                                .brownDark),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            color: GoodColors
                                                                .brownDark,
                                                            child: Center(
                                                              child: Text(
                                                                'نعيمي',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ),
                                                          ),
                                                          flex: 2,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 6,
                                                                    left: 5,
                                                                    right: 5),
                                                            child: TextField(
                                                              controller: n3imy,
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "السعر"),
                                                            ),
                                                          ),
                                                          flex: 2,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            color: GoodColors
                                                                .brownDark,
                                                            child: Center(
                                                              child: IconButton(
                                                                  icon: Icon(
                                                                    Icons.done,
                                                                    size: 17,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  onPressed:
                                                                      () {}),
                                                            ),
                                                          ),
                                                          flex: 1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              flex: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      flex: 1,
                                    ),
                                    Flexible(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 16,
                                            right: 16),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  padding: EdgeInsets.all(3),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 2,
                                                            color: GoodColors
                                                                .brownDark),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            color: GoodColors
                                                                .brownDark,
                                                            child: Center(
                                                              child: Text(
                                                                'حري',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ),
                                                          ),
                                                          flex: 2,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 6,
                                                                    left: 5,
                                                                    right: 5),
                                                            child: TextField(
                                                              controller: hry,
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "السعر"),
                                                            ),
                                                          ),
                                                          flex: 2,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            color: GoodColors
                                                                .brownDark,
                                                            child: Center(
                                                              child: IconButton(
                                                                  icon: Icon(
                                                                    Icons.done,
                                                                    size: 17,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  onPressed:
                                                                      () {}),
                                                            ),
                                                          ),
                                                          flex: 1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  padding: EdgeInsets.all(3),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 2,
                                                            color: GoodColors
                                                                .brownDark),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                            color: GoodColors
                                                                .brownDark,
                                                            child: Center(
                                                              child: Text(
                                                                "نجدى",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ),
                                                          ),
                                                          flex: 2,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 6,
                                                                    left: 5,
                                                                    right: 5),
                                                            child: TextField(
                                                              controller: nagdy,
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "السعر"),
                                                            ),
                                                          ),
                                                          flex: 2,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            color: GoodColors
                                                                .brownDark,
                                                            child: Center(
                                                              child: IconButton(
                                                                  icon: Icon(
                                                                    Icons.done,
                                                                    size: 17,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  onPressed:
                                                                      () {}),
                                                            ),
                                                          ),
                                                          flex: 1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              flex: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ),
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("images/home_pic.png"),
                          fit: BoxFit.fill,
                        )),
                        child: Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 15,
                            child: FlatButton(
                                onPressed: () {
                                  print(this.getDataToSend().toJson());
                                  updatePrices();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: GoodColors.brownDark,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child:this.updateApiCall ?  Container(height: 30 , width: 30, child: CircularProgressIndicator(),): Text(
                                      "حفظ الاسعار",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                )),
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
