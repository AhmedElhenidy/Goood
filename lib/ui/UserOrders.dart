import 'package:camel/Api/ClientApi.dart';
import 'package:camel/DataBase/config.dart';
import 'package:camel/statics/DataBaseConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:camel/admin/api/orders_api.dart';
import 'package:camel/admin/statics/admin_app_bar.dart';
import 'package:camel/model/OrderModel.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';

class UserOrders extends StatefulWidget {
  _UserOrdersState createState() => _UserOrdersState();
}
class _UserOrdersState extends State<UserOrders>{
  List<Order> orderList = List();
  GlobalKey<ScaffoldState> _scaffoldKeyProfile ;
  bool getAllOrdersApiCall=false;
  getAllOrders(){
    setState(() {
      getAllOrdersApiCall=true;
    });
    ClientApi.getUserOrder().then((response){
      setState(() {
        getAllOrdersApiCall=false;
      });
      orderList =response.orderList;
    },onError: (error){
      print("get All orders erorr ::  $error");
      setState(() {
        getAllOrdersApiCall=false;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile =GlobalKey<ScaffoldState>();
    this.getAllOrders();
  }
  String message ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true , title: Text("الطلبات"),  backgroundColor: GoodColors.brown,),
      body: getAllOrdersApiCall
          ?Center(child: CircularProgressIndicator(),)
          :Material(
        elevation: 3,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("العدد : ${orderList.length} طلب"),
                    )
                ),
              ),
              Flexible(
                flex: 8,
                child: Container(
                  child: ListView.builder(
                    itemCount: orderList.length,
                    padding: EdgeInsets.only(left: 16,right: 16,bottom: 16),
                    itemBuilder: (context,position){
                      return Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 230,
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>UserOrderDetails(orderList[position])));
                            },
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  bottom: 20,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        children: <Widget>[
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Container(
                                              width: MediaQuery.of(context).size.width,
                                              color: Colors.purpleAccent,
                                              child: Image.asset("images/order_photo.png",fit: BoxFit.fill,),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      child: Center(
                                                        child: Image.asset("images/time.png",width: 24,height: 24,),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 5,
                                                    child: Container(
                                                      padding: EdgeInsets.only(left: 16),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          Text("تاريخ الطلب : ${orderList[position].created_at.substring(0,10)}",
                                                            style: TextStyle(
                                                              color: GoodColors.brown,
                                                            ),
                                                          ),
                                                          Text("${orderList[position].created_at.substring(10,16)}  "
                                                              "${int.parse(orderList[position].created_at.substring(11,13))>12?"pm":"am"}",
                                                            textDirection: TextDirection.ltr,
                                                            style: TextStyle(
                                                              color: GoodColors.brown,
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
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      child: Center(
                                                        child: Image.asset("images/man_order.png",width: 24,height: 24,),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 5,
                                                    child: Container(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          Text("اسم العميل : ${orderList[position].name}",
                                                            style: TextStyle(
                                                              color: GoodColors.brown,
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
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      child: Center(
                                                        child: Image.asset("images/sheep_order.png",width: 24,height: 24,),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 5,
                                                    child: Container(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          Text("عدد الطلبات : ${orderList[position].product.length} طلبات",
                                                            style: TextStyle(
                                                              color: GoodColors.brown,
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
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      child: Center(
                                                        child: Image.asset("images/dollar_sign.png",width: 24,height: 24,),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 5,
                                                    child: Container(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          Text("السعر الكلى : ${orderList[position].price} رس",
                                                            style: TextStyle(
                                                              color: GoodColors.brown,
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
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 190,
                                  left: MediaQuery.of(context).size.width/6,
                                  right: MediaQuery.of(context).size.width/6,
                                  bottom: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: GoodColors.brownLight,
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("مشاركة عبر الواتس اب  ",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        Image.asset("images/whatsapp.png",width: 26,height: 26,),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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

class UserOrderDetails extends StatefulWidget{
  Order order ;
  UserOrderDetails(this.order);
  _UserOrderDetailsState createState()=> _UserOrderDetailsState();
}
class _UserOrderDetailsState extends State<UserOrderDetails>{

  List<Map<String, dynamic>> product = new List();
  bool getProductCall = true;
  getProduct() async {
    setState(() {
      this.getProductCall = true;
    });
    widget.order.product.forEach((pro)async{
      final response = await db.select(
          table: DataBaseConstants.PRODUCT_TABLE,
          where: "${DataBaseConstants.PRODUCT_TABLE_ID} = ${pro.id}",
          limit: 1);
      setState(() {
        product.add(response[0]);
        print("product choosen : : ${this.product}");
        this.getProductCall = false;
      });
    });

  }

  @override
  void initState() {
    super.initState();
    getProduct();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder:(context,widget){
        return Directionality(textDirection: TextDirection.rtl, child: widget);
      },
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
//          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//          floatingActionButton: InkWell(
//          onTap: (){
//            showDialog(context: context,
//                builder: (_)=>SendOrder(widget.order)
//            );
//          },
//          child: CircleAvatar(
//            radius: 35,
//            backgroundColor: Colors.transparent,
//            child: Image.asset("images/float.png",fit: BoxFit.fill,),
//          ),
//        ),
            appBar: AppBar(centerTitle: true , title: Text("الطلبات"),  backgroundColor: GoodColors.brown,),

            body: this.getProductCall ? Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ): Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 16,right: 16,top: 12,bottom: 12),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left:1.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(7),
                                  bottomRight: Radius.circular(7),
                                ),
                              ),
                              child: Center(child: Text("${widget.order.product.length} منتجات")),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right :1.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(7),
                                  bottomLeft: Radius.circular(7),
                                ),
                              ),
                              child: Center(child: Text("${widget.order.price} ريال")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: Container(
                    child: ListView.builder(
                      itemCount: product.length,
                      itemBuilder: (context,position){
                        Map<String,dynamic> produc = product[position];
                        return Padding(
                          padding: const EdgeInsets.only(top :16.0,left: 16,right: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                    flex: 2,
                                    child: Container(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              child: Image.asset(produc[DataBaseConstants.PRODUCT_TABLE_IMAGE],fit: BoxFit.fill,),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: <Widget>[
                                                  Text("  ${produc[DataBaseConstants.PRODUCT_TABLE_NAME]}",
                                                    style: TextStyle(
                                                      color: GoodColors.brown,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom:8.0),
                                                    child: Container(
                                                      width: 50,
                                                      height: 2,
                                                      color: GoodColors.brownDark,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        padding: EdgeInsets.only(top: 2,bottom: 2,right: 12,left: 12),
                                                        decoration: BoxDecoration(
                                                          color: GoodColors.brownDark,
                                                          borderRadius: BorderRadius.circular(7),
                                                        ),
                                                        child: Center(
                                                          child: Text("العدد",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text("   ${widget.order.product[position].quantity} ${produc[DataBaseConstants.PRODUCT_TABLE_NAME]}",
                                                        style: TextStyle(
                                                            color: GoodColors.brown
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
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: widget.order.product[position].spacifcation.length >0 ? Container(
                                              padding: EdgeInsets.only(top:9,bottom: 9,left: 9),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(17),
                                                child: Container(
                                                  color: GoodColors.brownLight,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        padding: EdgeInsets.only(top: 2,bottom: 2,right: 16,left: 16),
                                                        decoration: BoxDecoration(
                                                          color: GoodColors.brownDark,
                                                          borderRadius: BorderRadius.circular(17),
                                                        ),
                                                        child: Center(
                                                          child: Text("${widget.order.product[position].spacifcation[0].key}",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text("   ${widget.order.product[position].spacifcation[0].value}",
                                                        style: TextStyle(
                                                            color: GoodColors.brownDark
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ) : Container(),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: widget.order.product[position].spacifcation.length >1 ? Container(
                                              padding: EdgeInsets.only(top:9,bottom: 9,left: 9),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(17),
                                                child: Container(
                                                  color: GoodColors.brownLight,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        padding: EdgeInsets.only(top: 2,bottom: 2,right: 16,left: 16),
                                                        decoration: BoxDecoration(
                                                          color: GoodColors.brownDark,
                                                          borderRadius: BorderRadius.circular(17),
                                                        ),
                                                        child: Center(
                                                          child: Text("${widget.order.product[position].spacifcation[1].key}",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text("   ${widget.order.product[position].spacifcation[1].value}",
                                                        style: TextStyle(
                                                            color: GoodColors.brownDark
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ) : Container(),
                                          ),
                                        ],
                                      ) ,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: widget.order.product[position].spacifcation.length>2 ?Container(
                                              padding: EdgeInsets.only(top:9,bottom: 9,left: 9),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(17),
                                                child: Container(
                                                  color: GoodColors.brownLight,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        padding: EdgeInsets.only(top: 2,bottom: 2,right: 16,left: 16),
                                                        decoration: BoxDecoration(
                                                          color: GoodColors.brownDark,
                                                          borderRadius: BorderRadius.circular(17),
                                                        ),
                                                        child: Center(
                                                          child: Text("${widget.order.product[position].spacifcation[2].key}",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text("   ${widget.order.product[position].spacifcation[2].value}",
                                                        style: TextStyle(
                                                            color: GoodColors.brownDark
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ) :Container(),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: widget.order.product[position].spacifcation.length >3 ?Container(
                                              padding: EdgeInsets.only(top:9,bottom: 9,left: 9),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(17),
                                                child: Container(
                                                  color: GoodColors.brownLight,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        padding: EdgeInsets.only(top: 2,bottom: 2,right: 16,left: 16),
                                                        decoration: BoxDecoration(
                                                          color: GoodColors.brownDark,
                                                          borderRadius: BorderRadius.circular(17),
                                                        ),
                                                        child: Center(
                                                          child: Text("${widget.order.product[position].spacifcation[3].key}",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text("   ${widget.order.product[position].spacifcation[3].value}",
                                                        style: TextStyle(
                                                            color: GoodColors.brownDark
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ):Container(),
                                          ),
                                        ],
                                      ) ,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 2,
                                              child:widget.order.product[position].spacifcation.length >4 ? Container(
                                                padding: EdgeInsets.only(top:9,bottom: 9,left: 9),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(17),
                                                  child: Container(
                                                    color: GoodColors.brownLight,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Container(
                                                          padding: EdgeInsets.only(top: 2,bottom: 2,right: 16,left: 16),
                                                          decoration: BoxDecoration(
                                                            color: GoodColors.brownDark,
                                                            borderRadius: BorderRadius.circular(17),
                                                          ),
                                                          child: Center(
                                                            child: Text("${widget.order.product[position].spacifcation[4].key}",
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text("   ${widget.order.product[position].spacifcation[4].value}",
                                                          style: TextStyle(
                                                              color: GoodColors.brownDark
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ) : Container(),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      child:Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              padding: EdgeInsets.all(6),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: GoodColors.brownDark,
                                                    borderRadius: BorderRadius.circular(8)
                                                ),
                                                child: Center(
                                                  child: Text("سعر هذا الطلب : ${widget.order.product[position].price} ريال",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ) ,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}