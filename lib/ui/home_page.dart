import 'package:camel/Api/ClientApi.dart';
import 'package:camel/DataBase/config.dart';
import 'package:camel/admin/api/slider_api.dart';
import 'package:camel/admin/model/slider.dart';
import 'package:camel/statics/DataBaseConstants.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:camel/ui/slices.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'hashy_category.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  GlobalKey<ScaffoldState> _scaffoldKeyProfile;
  @override
  void initState() {
    this.getCategories();
    this.getPrices();
    this.getSlider();
    super.initState();
    _scaffoldKeyProfile = new GlobalKey<ScaffoldState>();
  }
  List<Map<String, dynamic>> categories = new List();
  List<SliderModel> sliderList = new List();
  List<Widget> carouselSliderItems = new List();
  bool getCategoriesCall = false;
  bool getSliderCall = false;
  Widget sliderItem(SliderModel slider){
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.all(4),
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 1.2,
        child: Image.network(slider.imageLink,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
  getSlider(){
    setState(() {
     getSliderCall = true;
    });
    SliderApi.getAllSlider().then((response){
      sliderList =response.sliderList;
      setState(() {
        sliderList.forEach((slider) =>
            carouselSliderItems.add(sliderItem(slider)));
        getSliderCall = false;
      });
    },onError: (error){
      print("get Slider Error : :  $error");
      setState(() {
        getSliderCall = false;
      });
    });
  }
  getPrices(){
    ClientApi.getPrices().then((response) {
      setState(() {
        this.text = response.products.toString();
      });
        response.products?.forEach((product)async{
          Map<String,String> row ={
            DataBaseConstants.PRODUCT_TABLE_PRICE : product.price
          };
          await db.update(table: DataBaseConstants.PRODUCT_TABLE, row: row, where: "${DataBaseConstants.PRODUCT_TABLE_ID} = ${product.id}");
          final testResponse= await db.select(table: DataBaseConstants.PRODUCT_TABLE);
          print(testResponse);
        });
      setState(() {
        this.getCategoriesCall = false;
      });

    } ,onError: (error){
      print("error : : $error");
      setState(() {
        text = error.toString() ;
      });
    });
  }
  getCategories() async {
    setState(() {
      this.getCategoriesCall = true;
    });
    print("get Categories ");
    List<Map<String, dynamic>> rows = await db
        .select(
      table: "${DataBaseConstants.CATEGORY_TABLE}",
      columns:
          "${DataBaseConstants.CATEGORY_TABLE_ID},${DataBaseConstants.CATEGORY_TABLE_NAME} ,${DataBaseConstants.CATEGORY_TABLE_IMAGE}",
    )
        .catchError((e) {
      throw ("Error selecting data: ${e.message}");
    });
    print("catagories : : $rows");
    setState(() {
      this.categories = rows;

    });
  }
  String text = '' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKeyProfile,
      body: getCategoriesCall
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(child: CircularProgressIndicator(),),
            ): Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 4),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider(
                          items:carouselSliderItems,
                          viewportFraction: .80,
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
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0, top: 4),
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "images/category.png",
                                  width: 22,
                                  height: 22,
                                ),
                                Text(
                                  "  الأقسام",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'black75',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              //الحاشى
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, bottom: 10, right: 16),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HashyCategory()));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(17),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2.95,
                                        color: Colors.white,
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                              bottom: 0,
                                              left: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: GoodColors.brown,
                                                ),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.5,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    5,
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              right: -2,
                                              child: CircleAvatar(
                                                radius: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4.7,
                                                backgroundColor: Colors.white,
                                                child: Padding(
                                                  padding: EdgeInsets.all(16),
                                                  child: Center(
                                                    child: Image.asset(
                                                        "images/${this.categories[0][DataBaseConstants.CATEGORY_TABLE_IMAGE]}"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 15,
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  24,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  24,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Text(
                                                      "${this.categories[0][DataBaseConstants.CATEGORY_TABLE_NAME]}",
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.white,
                                                        fontFamily: 'black75',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, bottom: 16, right: 16),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Slices()));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(17),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2.95,
                                        color: Colors.white,
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                              bottom: 0,
                                              left: 0,
                                              child: Container(
                                                color: GoodColors.brown,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.5,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    5,
                                              ),
                                            ),
                                            Positioned(
                                              top: -1,
                                              right: -2,
                                              child: CircleAvatar(
                                                radius: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4.7,
                                                backgroundColor: Colors.white,
                                                child: Padding(
                                                  padding: EdgeInsets.all(16),
                                                  child: Center(
                                                    child: Image.asset(
                                                        "images/${this.categories[1][DataBaseConstants.CATEGORY_TABLE_IMAGE]}"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 15,
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  24,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  24,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Text(
                                                      "${this.categories[1][DataBaseConstants.CATEGORY_TABLE_NAME]}",
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.white,
                                                        fontFamily: 'black75',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
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
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
