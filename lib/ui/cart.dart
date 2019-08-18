import 'package:camel/statics/app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
class Cart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CartState();
  }
}
class _CartState extends State<Cart>{
  GlobalKey<ScaffoldState> _scaffoldKeyProfile;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile = new GlobalKey<ScaffoldState>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBarClass().appBar(context,_scaffoldKeyProfile,false,title: "السلة",),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context,position){
              return Padding(
                padding: const EdgeInsets.only(bottom:16.0),
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
                            child: Image.asset("images/cheap.png",fit: BoxFit.fill,),
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
                                  padding: const EdgeInsets.only(right:8.0,top: 8,left: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("نعيمي",
                                        style: TextStyle(
                                          color:GoodColors.brown ,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Container(
                                        width: 18,
                                        height: 18,
                                        padding: EdgeInsets.all(2),
                                        decoration:BoxDecoration(
                                          color: GoodColors.greyLight,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: InkWell(
                                            child: Icon(Icons.close,size: 12,),
                                          ),
                                        ),

                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right:8.0,bottom: 4),
                                      child: Container(
                                        color: GoodColors.brownDark,
                                        height: 3,
                                        width:30
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          constraints: BoxConstraints(maxWidth: 200),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(right: 16,left: 16),
                                                decoration:BoxDecoration(
                                                  color: GoodColors.brown,
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
                                              Container(
                                                padding: EdgeInsets.all(1),
                                                decoration: BoxDecoration(
                                                    color: GoodColors.brownDark,
                                                    borderRadius: BorderRadius.circular(20)
                                                ),
                                                child: Icon(Icons.add,size: 14,color: Colors.white,),
                                              ),
                                              Container(
                                                  padding: EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                      color: GoodColors.brownDark,
                                                      borderRadius: BorderRadius.circular(7)
                                                  ),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text("01",
                                                        style: TextStyle(
                                                            color: Colors.white
                                                        ),
                                                      ),
                                                      Icon(Icons.arrow_drop_down,color: Colors.white,size: 14,),
                                                    ],
                                                  )
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(1),
                                                decoration: BoxDecoration(
                                                    color: GoodColors.brownDark,
                                                    borderRadius: BorderRadius.circular(20)
                                                ),
                                                child: Icon(Icons.remove,size: 14,color: Colors.white,),
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
                                      padding: const EdgeInsets.only(right :8.0,top: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(right: 16,left: 16),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(6),
                                                color: GoodColors.brown
                                            ),
                                            child: Text("الإجمالى",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right :8.0,top: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(right: 16,left: 16),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(6),
                                                color: GoodColors.brownDark
                                            ),
                                            child: Text("150 رس",
                                              style: TextStyle(
                                                color: Colors.white,
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
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left :16.0,right: 16,bottom: 16),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(height: 35,
                padding: EdgeInsets.only(left: 8,right: 8,bottom: 4),
                decoration: BoxDecoration(
                  color: GoodColors.brownLight,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right :8.0,top: 4,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Container(
                              padding: EdgeInsets.only(bottom: 2,right: 1,left: 1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  width: 2,
                                  color: GoodColors.brownDark,
                                )
                              ),
                              child: Center(child: Icon(Icons.attach_money,color: GoodColors.brownDark,)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 16,left: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: GoodColors.brown
                            ),
                            child: Text("المطلوب الإجمالى",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right :8.0,top: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 16,left: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: GoodColors.brownDark
                            ),
                            child: Text("150 رس",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
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
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("التأكيد  ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
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
          height: 70,
        ),
      ),

    );
  }
}