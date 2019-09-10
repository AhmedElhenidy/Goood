import 'package:camel/DataBase/SqliteDataBase.dart';
import 'package:camel/DataBase/config.dart';
import 'package:camel/statics/DataBaseConstants.dart';
import 'package:camel/statics/app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:camel/ui/zabaeh.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:sqlcool/sqlcool.dart';
import 'buy_slices.dart';

class Slices extends StatefulWidget {
  _SlicesState createState() => _SlicesState();
}

class _SlicesState extends State<Slices> {
  GlobalKey<ScaffoldState> _scaffoldKeyProfile;
  List<String> images = new List();
  List<String> names = List();
  SelectBloc bloc;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile = new GlobalKey<ScaffoldState>();
    bloc = SelectBloc(
        table: DataBaseConstants.PRODUCT_TABLE,
        database: db,
        where: "${DataBaseConstants.PRODUCT_TABLE_CATEGORY} = 2",
        reactive: true);
    getLikedProducts();

  }
  getLikedProducts() async{
    final response =await db.select(table: DataBaseConstants.WISH_LIST_TABLE );
    List<int> likedProductslocal = new List() ;
    response.forEach((product){
      likedProductslocal.add(product[DataBaseConstants.WISH_LIST_TABLE_PRODUCT_ID]);
    });
    setState(() {
      this.likedProducts = likedProductslocal ;
    });
  }
  List<int> likedProducts = new List() ;
  bool isLiked(int productId){
   if( likedProducts.contains(productId)){
     return true ;
   }else{
     return false ;
   }
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  int count;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SqlLiteDataBase.getShoppingCartCount().then((count) {
      setState(() {
        this.count = count;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarClass().appBar(context, _scaffoldKeyProfile, false, count,
            title: "الذبائح"),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(left: 8, right: 8, bottom: 16),
          color: Colors.white,
          child: StreamBuilder<List<Map>>(
            stream: bloc.items,
            builder: (context, snapShot) {
              print(snapShot?.data);
              return !snapShot.hasData
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.count(
                      padding: EdgeInsets.only(
                          top: 16, right: 8, left: 8, bottom: 16),
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      crossAxisCount: 2,
                      childAspectRatio:
                          (MediaQuery.of(context).size.width / 2 - 32) /
                              (MediaQuery.of(context).size.height / 3),
                      children: List.generate(
                        4,
                        (index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Zbaeh(
                                          snapShot.data[index][DataBaseConstants
                                              .PRODUCT_TABLE_ID])));
                            },
                            child: Material(
                              elevation: 5,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 2.4,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Flexible(
                                          flex: 4,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            child: Stack(
                                              children: <Widget>[
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  left: 0,
                                                  bottom: 0,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(8),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8)),
                                                    child: Container(
                                                      child: Image(
                                                        image: AssetImage(snapShot
                                                                .data[index][
                                                            DataBaseConstants
                                                                .PRODUCT_TABLE_IMAGE]),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 8,
                                                  left: 8,
                                                  child: LikeButton(
                                                    isLiked: isLiked(snapShot.data[index][DataBaseConstants.PRODUCT_TABLE_ID]) ,
                                                    onTap: (isLiked)async{
                                                      return await SqlLiteDataBase.addOrRemoveWishList(snapShot.data[index][DataBaseConstants.PRODUCT_TABLE_ID]);
                                                    },
                                                    circleColor: CircleColor(
                                                        start: Colors.white,
                                                        end: GoodColors.brown),
                                                    likeBuilder: (widget) {
                                                      return Container(
                                                        child: !widget
                                                            ? Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: Colors
                                                                    .white,
                                                              )
                                                            : Icon(
                                                                Icons.favorite,
                                                                color:
                                                                    GoodColors
                                                                        .brown,
                                                              ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Container(
                                            color: Colors.white,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Flexible(
                                                  flex: 1,
                                                  child: Text(
                                                    snapShot.data[index][
                                                        DataBaseConstants
                                                            .PRODUCT_TABLE_NAME],
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'black75',
                                                        color:
                                                            GoodColors.brown),
                                                  ),
                                                ),
                                                Flexible(
                                                  flex: 1,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(Icons
                                                          .monetization_on),
                                                      Text(
                                                        " ${snapShot.data[index][DataBaseConstants.PRODUCT_TABLE_PRICE]} ",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontFamily: 'bold65',
                                                            color: GoodColors
                                                                .brown),
                                                      ),
                                                      Text("رس ",
                                                        style: TextStyle(
                                                          fontFamily: 'bold65',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: InkWell(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  top: 4, bottom: 6),
                                              color: GoodColors.brown,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    "اطلب الآن ",
                                                    style: TextStyle(
                                                      color: Colors.white,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
            },
          ),
        ));
  }
}
