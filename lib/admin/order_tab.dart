import 'package:camel/DataBase/config.dart';
import 'package:camel/model/OrderModel.dart';
import 'package:camel/statics/DataBaseConstants.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
class OrderTab extends StatefulWidget{
  Order order;
  OrderTab(this.order);
  _OrderTabState createState()=>_OrderTabState();
}
class _OrderTabState extends State<OrderTab>{
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
    return Container(
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
    );
  }
}