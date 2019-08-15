import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
class OrderTab extends StatefulWidget{
  _OrderTabState createState()=>_OrderTabState();
}
class _OrderTabState extends State<OrderTab>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.red,
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 16,right: 16,top: 12,bottom: 12),
              color: Colors.green,
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
                        child: Center(child: Text("3 طلبات")),
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
                        child: Center(child: Text("1500 ريال")),
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
              color: Colors.blue,
              child: ListView.builder(
                itemBuilder: (context,position){
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
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex:8,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(17),
                                    child: Container(
                                      color: GoodColors.brownLight,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              padding: EdgeInsets.only(right: 8,left: 8),
                                              decoration: BoxDecoration(
                                                color: GoodColors.brownDark,
                                                borderRadius: BorderRadius.circular(17),
                                              ),
                                              child: Center(
                                                child: Text("الحجم",
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: const EdgeInsets.only(right :16.0),
                                              child: Align(
                                                alignment: Alignment.centerRight,
                                                child: Text("كبير",
                                                  style: TextStyle(
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
                                Expanded(flex: 1,
                                  child: Container(),),
                                Expanded(
                                  flex: 8,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(17),
                                    child: Container(
                                      color: GoodColors.brownLight,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              padding: EdgeInsets.only(right: 8,left: 8),
                                              decoration: BoxDecoration(
                                                color: GoodColors.brownDark,
                                                borderRadius: BorderRadius.circular(17),
                                              ),
                                              child: Center(
                                                child: Text("الرأس",
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: const EdgeInsets.only(right :16.0),
                                              child: Align(
                                                alignment: Alignment.centerRight,
                                                child: Text("مسلوخ",
                                                  style: TextStyle(
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
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex:8,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(17),
                                    child: Container(
                                      color: GoodColors.brownLight,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              padding: EdgeInsets.only(right: 8,left: 8),
                                              decoration: BoxDecoration(
                                                color: GoodColors.brownDark,
                                                borderRadius: BorderRadius.circular(17),
                                              ),
                                              child: Center(
                                                child: Text("الحجم",
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: const EdgeInsets.only(right :16.0),
                                              child: Align(
                                                alignment: Alignment.centerRight,
                                                child: Text("كبير",
                                                  style: TextStyle(
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
                                Expanded(flex: 1,
                                  child: Container(),),
                                Expanded(
                                  flex: 8,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(17),
                                    child: Container(
                                      color: GoodColors.brownLight,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              padding: EdgeInsets.only(right: 8,left: 8),
                                              decoration: BoxDecoration(
                                                color: GoodColors.brownDark,
                                                borderRadius: BorderRadius.circular(17),
                                              ),
                                              child: Center(
                                                child: Text("الرأس",
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: const EdgeInsets.only(right :16.0),
                                              child: Align(
                                                alignment: Alignment.centerRight,
                                                child: Text("مسلوخ",
                                                  style: TextStyle(
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