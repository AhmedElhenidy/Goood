import 'package:camel/admin/client_tab.dart';
import 'package:camel/admin/drivers.dart';
import 'package:camel/admin/order_tab.dart';
import 'package:camel/admin/statics/admin_app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
class Orders extends StatefulWidget {
  _OrdersState createState() => _OrdersState();
}
class _OrdersState extends State<Orders>{
  GlobalKey<ScaffoldState> _scaffoldKeyProfile ;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile =GlobalKey<ScaffoldState>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBarClass().appBar(context, _scaffoldKeyProfile,"الطلبات"),
      body: Container(
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
                  child: Text("العدد : 125 طلب"),
                )
              ),
            ),
            Flexible(
              flex: 8,
              child: Container(
                child: ListView.builder(
                  itemCount: 9,
                  padding: EdgeInsets.only(left: 16,right: 16,bottom: 16),
                  itemBuilder: (context,position){
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 230,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails()));
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
                                                        Text("تاريخ الطلب : 20/9/2019",
                                                          style: TextStyle(
                                                            color: GoodColors.brown,
                                                          ),
                                                        ),
                                                        Text("03:30 pm",
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
                                                        Text("اسم العميل : محمد علاء سعفان",
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
                                                        Text("عدد الطلبات : 3 طلبات",
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
                                                        Text("السعر الكلى : 150 رس",
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
    );
  }

}

class OrderDetails extends StatefulWidget{
  _OrderDetailsState createState()=> _OrderDetailsState();
}
class _OrderDetailsState extends State<OrderDetails>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder:(context,widget){
        return Directionality(textDirection: TextDirection.rtl, child: widget);
      },
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: InkWell(
            onTap: (){
              showDialog(context: context,
                builder: (_)=>SendOrder()
              );
            },
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.transparent,
              child: Image.asset("images/float.png",fit: BoxFit.fill,),
            ),
          ),
          appBar: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                height: 50,//MediaQuery.of(context).size.height/15,
                width: MediaQuery.of(context).size.width,
                //constraints: BoxConstraints(minHeight: 30,maxHeight: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('تفاصيل الطلب',
                      style: TextStyle(
                        color: GoodColors.brownDark,
                        fontSize:18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      child: Container(
                        width: 24,
                        height: 24,
                        child: Image.asset("images/bell.png",fit: BoxFit.fill,),
                      ),
                    )
                    //MediaQuery.of(context).size.width/8,),
                    /* Expanded(
                flex: 1,
                child: Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('$title',
                      style: TextStyle(
                        color: GoodColors.brown,
                        fontSize:18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.shopping_cart,
                            size: 30,
                          ),
                              onPressed: (){
                                /*Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ShoppingCart()));*/
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),*/
                  ],
                ),
              ),
            ],
            bottom: TabBar(
              unselectedLabelColor: Colors.grey,
              indicatorColor: GoodColors.brownDark,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: GoodColors.brownDark,
              tabs: [
                Tab(child: Text("الطلبات"),),
                Tab(
                  child: Text("العميل"),
                ),

              ],
            ),
          ),
          body: TabBarView(
            children: [
              OrderTab(),
              ClientTab(),
            ],
          ),
        ),
      ),
    );
  }
}
class SendOrder extends StatefulWidget{
  _SendOrderState createState()=> _SendOrderState();
}
class _SendOrderState extends State<SendOrder>{
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(8)
      ),
      child: Container(
        padding: EdgeInsets.only(bottom: 16),
        height: MediaQuery.of(context).size.height/1.2,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(16),
                child:
                Column(
                  children: <Widget>[
                    Flexible(
                      flex: 5,
                      child: Center(
                        child: Text("إرسال الطلب",
                          style: TextStyle(
                            color: GoodColors.brownDark,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          color: GoodColors.greyLight,
                          height: 3,
                          width: MediaQuery.of(context).size.width/2.7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (context,position){
                    return Padding(
                      padding: const EdgeInsets.only(bottom:16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: (){
//                            showDialog(context: context,
//                                builder: (context)=>DriverInfo(position,"محمد علاء سعفان","11230216","لا توجد ملاحظات")
//                            );
                          },
                          child: Card(
                            elevation: 10,
                            child: Container(
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Center(child: Text("${position+1}")),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Center(
                                        child: CircleAvatar(
                                          radius: 28,
                                          backgroundColor: Colors.white,
                                          child: Image.asset("images/driver_pic.png"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Flexible(
                                            flex: 1,
                                            fit: FlexFit.tight,
                                            child: Container(
                                              padding: EdgeInsets.only(right: 1,top: 16),
                                              child: Align(
                                                  alignment: Alignment.bottomCenter,
                                                  child: Text("محمد علاء سعفان",style: TextStyle(fontSize: 17),)),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            fit: FlexFit.tight,
                                            child: Container(
                                              padding: EdgeInsets.only(right: 0,left: 2),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: <Widget>[
                                                  Text("01065432596"),
                                                  Image.asset("images/whats.png",width:25,height: 25 ,),
                                                  Image.asset("images/ring.png",width:25,height: 25 ,),

                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.only(left:2,right: 2),
                                      color: GoodColors.brownLight,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset("images/sent-mail.png",fit: BoxFit.fill,),
                                        ],
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}