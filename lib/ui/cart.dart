import 'package:camel/Api/ClientApi.dart';
import 'package:camel/DataBase/SqliteDataBase.dart';
import 'package:camel/DataBase/config.dart';
import 'package:camel/model/OrderToSent.dart';
import 'package:camel/statics/DataBaseConstants.dart';
import 'package:camel/statics/app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:camel/ui/confirm_order.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:sqlcool/sqlcool.dart';

class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartState();
  }
}

class _CartState extends State<Cart> {
  GlobalKey<ScaffoldState> _scaffoldKeyProfile;
  int count = 0;
  SelectBloc bloc;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile = new GlobalKey<ScaffoldState>();
    bloc = SelectBloc(
        database: db,
        table: DataBaseConstants.SHOPPING_CART_TABLE,
        columns:
            "${DataBaseConstants.SHOPPING_CART_TABLE}.${DataBaseConstants.SHOPPING_CART_TABLE_ID} as id , "
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_ID} as productId , "
            "${DataBaseConstants.SHOPPING_CART_TABLE}.${DataBaseConstants.SHOPPING_CART_TABLE_PRODUCT_QTY} as quantity ,"
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_IMAGE} as image ,"
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_NAME} as name ,"
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_PRICE} as price",
        joinTable: DataBaseConstants.PRODUCT_TABLE,
        joinOn:
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_ID} = ${DataBaseConstants.SHOPPING_CART_TABLE}.${DataBaseConstants.SHOPPING_CART_TABLE_PRODUCT_ID}",
        reactive: true);

    getTotalPrince();
    this.prepareOrder();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

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

  int number = 1;
  double totalPrice = 0;
  OrderToSent order;
  bool saveOrderApi = false;
  List<Product> productList = new List();
  prepareOrder() async {
    List<Map<String, dynamic>> products = await db.join(
        table: DataBaseConstants.SHOPPING_CART_TABLE,
        columns:
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_ID} as productId , "
            "${DataBaseConstants.SHOPPING_CART_TABLE}.${DataBaseConstants.SHOPPING_CART_TABLE_ID} as id , "
            "${DataBaseConstants.SHOPPING_CART_TABLE}.${DataBaseConstants.SHOPPING_CART_TABLE_PRODUCT_QTY} as quantity ,"
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_IMAGE} as image ,"
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_NAME} as name ,"
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_PRICE} as price",
        joinTable: DataBaseConstants.PRODUCT_TABLE,
        joinOn:
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_ID} = ${DataBaseConstants.SHOPPING_CART_TABLE}.${DataBaseConstants.SHOPPING_CART_TABLE_PRODUCT_ID}",
        verbose: true);

    print("get Prroducts For Preparing :  : :$products");
    products.forEach((product) async {
      List<Spacifcation> specificationList = new List();
      print("getting specification for ${product["productId"]}...");
      List<Map<String, dynamic>> specification = await db.select(
          table: DataBaseConstants.SHOPPING_CART_SPECIFICATION_TABLE,
          where:
              "${DataBaseConstants.SHOPPING_CART_SPECIFICATION_TABLE_SHOPPING_ID} = ${product[DataBaseConstants.SHOPPING_CART_TABLE_ID]}");
      specification.forEach((speci) {
        specificationList.add(new Spacifcation(
            key: speci[DataBaseConstants.SHOPPING_CART_SPECIFICATION_TABLE_KEY],
            value: speci[
                DataBaseConstants.SHOPPING_CART_SPECIFICATION_TABLE_VALUE]));
      });
      print("getting product list...");
      productList.add(new Product(
          id: "${product['productId']}", qty: "${product['quantity']}",spacifcation: specificationList));
      print("finish the product List ");
    });
  }

  void saveOrder() async {
    setState(() {
      this.saveOrderApi = true;
    });
    this.order =
        new OrderToSent(price: "$totalPrice", productList: productList);
    final resposne = await ClientApi.addOrder(this.order);
    setState(() {
      this.saveOrderApi = false;
    });
    if (!resposne.errors) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ConfirmOrder(resposne.order)));
      db.delete(table: DataBaseConstants.SHOPPING_CART_TABLE, where: "id != 0");
    }
  }

  getTotalPrince() async {
    setState(() {
      this.totalPrice = 0 ;
    });
    List<Map<String, dynamic>> products = await db.join(
        table: DataBaseConstants.SHOPPING_CART_TABLE,
        columns:
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_ID} as productId , "
            "${DataBaseConstants.SHOPPING_CART_TABLE}.${DataBaseConstants.SHOPPING_CART_TABLE_PRODUCT_QTY} as quantity ,"
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_IMAGE} as image ,"
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_NAME} as name ,"
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_PRICE} as price",
        joinTable: DataBaseConstants.PRODUCT_TABLE,
        joinOn:
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_ID} = ${DataBaseConstants.SHOPPING_CART_TABLE}.${DataBaseConstants.SHOPPING_CART_TABLE_PRODUCT_ID}",
        verbose: true);
    products.forEach((product) {
      setState(() {
        this.totalPrice += (double.tryParse(
                "${product[DataBaseConstants.PRODUCT_TABLE_PRICE]}") *
            double.parse(
                "${product[DataBaseConstants.SHOPPING_CART_TABLE_PRODUCT_QTY]}"));
        if(product['productId'] == 4 ){
          this.totalPrice += 40 ;
          this.hashMeetCheck = true ;
        }
      });
    });
    print("total Price : :: $totalPrice");
  }
bool hashMeetCheck = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarClass().appBar(
        context,
        _scaffoldKeyProfile,
        false,
        count,
        title: "السلة",
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: StreamBuilder<List<Map>>(
              stream: bloc.items,
              builder: (context, snapshot) {
                print("shopping Cart Data  : : :${snapshot.data}");
                return !snapshot.hasData
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : totalPrice == 0
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Center(
                              child: Text(
                                "لا يوجد اي منتجات..",
                                style: TextStyle(
                                    fontSize: 18, color: GoodColors.grey),
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, position) {
                              var product = snapshot.data[position];
                              this.number = product[DataBaseConstants
                                  .SHOPPING_CART_TABLE_PRODUCT_QTY];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Card(
                                  semanticContainer: true,
                                  elevation: 10,
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                              ),
                                              color: Colors.yellowAccent,
                                            ),
                                            height: 120,
                                            child: Image.asset(
                                              product[DataBaseConstants
                                                  .PRODUCT_TABLE_IMAGE],
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                bottomLeft: Radius.circular(8),
                                              ),
                                              color: Colors.white,
                                            ),
                                            height: 120,
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0,
                                                          top: 8,
                                                          left: 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        product[DataBaseConstants
                                                            .PRODUCT_TABLE_NAME],
                                                        style: TextStyle(
                                                          color:
                                                              GoodColors.brown,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 25,
                                                        height: 25,
                                                        padding:
                                                            EdgeInsets.all(2),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: GoodColors
                                                              .greyLight,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: Center(
                                                          child: InkWell(
                                                            onTap: () async {
                                                              print(
                                                                  "deleting  ::  :${product[DataBaseConstants.SHOPPING_CART_TABLE_ID]}");
                                                              var deleteITem =
                                                                  await db.delete(
                                                                      table: DataBaseConstants
                                                                          .SHOPPING_CART_TABLE,
                                                                      where:
                                                                          "${DataBaseConstants.SHOPPING_CART_TABLE_ID} = ${product[DataBaseConstants.SHOPPING_CART_TABLE_ID]}");
                                                              print(
                                                                  "deleted  ::  :$deleteITem");
                                                              this.getShoppingCartCount();
                                                              this.getTotalPrince();
                                                            },
                                                            child: Icon(
                                                              Icons.close,
                                                              size: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0,
                                                              bottom: 4),
                                                      child: Container(
                                                          color: GoodColors
                                                              .brownDark,
                                                          height: 3,
                                                          width: 30),
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        flex: 3,
                                                        child: Container(
                                                          constraints:
                                                              BoxConstraints(
                                                                  maxWidth:
                                                                      200),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            16,
                                                                        left:
                                                                            16),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      GoodColors
                                                                          .brown,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    "العدد",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              2),
                                                                  decoration: BoxDecoration(
                                                                      color: GoodColors
                                                                          .brownDark,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              7)),
                                                                  child: Row(
                                                                    children: <
                                                                        Widget>[
                                                                      Text(
                                                                        "$number",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .arrow_drop_down,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            14,
                                                                      ),
                                                                    ],
                                                                  )),
                                                              Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(1),
                                                              ),    Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(1),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0,
                                                              top: 8),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 16,
                                                                    left: 16),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6),
                                                                color:
                                                                    GoodColors
                                                                        .brown),
                                                            child: Text(
                                                              "الإجمالى",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0,
                                                              top: 8),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 16,
                                                                    left: 16),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6),
                                                                color: GoodColors
                                                                    .brownDark),
                                                            child: Text(
                                                              "${product[DataBaseConstants.PRODUCT_TABLE_PRICE] * number} رس",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
              }),
        ),
      ),
      bottomSheet: this.totalPrice == 0
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 35,
                      padding: EdgeInsets.only(left: 8, right: 8, bottom: 4),
                      decoration: BoxDecoration(
                        color: GoodColors.brownLight,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 8.0,
                              top: 4,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        bottom: 2, right: 1, left: 1),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                          width: 2,
                                          color: GoodColors.brownDark,
                                        )),
                                    child: Center(
                                        child: Icon(
                                      Icons.attach_money,
                                      color: GoodColors.brownDark,
                                    )),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 16, left: 16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: GoodColors.brown),
                                  child: Text(
                                    "المطلوب الإجمالى",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0, top: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(right: 16, left: 16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: GoodColors.brownDark),
                                  child: Text(
                                    "$totalPrice رس",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        !hashMeetCheck ? Container():  Container(
                            padding: EdgeInsets.only(right: 16),
                              child: Center(
                                child: Text(
                                  "يزيد 40 رس توصيل",
                                  style: TextStyle(
                                    fontFamily: 'bold65',
                                    color: Colors.white,
                                    fontSize: 10
                                  ),
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        saveOrder();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: GoodColors.brownDark,
                        ),
                        height: 35,
                        child: this.saveOrderApi
                            ? CircularProgressIndicator()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "التأكيد  ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
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
                height: 70,
              ),
            ),
    );
  }
}
