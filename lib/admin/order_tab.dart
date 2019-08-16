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
                            Flexible(
                              flex: 2,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: Image.asset("images/cheap.png",fit: BoxFit.fill,),
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
                                            Text("  نعيمي",
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
                                                Text("   2 نعيمي",
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
                                      flex: 1,
                                      child: Container(
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
                                                    child: Text("الحجم",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text("   كبير",
                                                  style: TextStyle(
                                                      color: GoodColors.brownDark
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
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
                                                    child: Text("الرأس",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text("   مسلوح",
                                                  style: TextStyle(
                                                      color: GoodColors.brownDark
                                                  ),
                                                ),
                                              ],
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
                              flex: 1,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
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
                                                    child: Text("التقطيع",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text("   أنصاف",
                                                  style: TextStyle(
                                                      color: GoodColors.brownDark
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
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
                                                    child: Text("مفروم",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text("   5 ك",
                                                  style: TextStyle(
                                                      color: GoodColors.brownDark
                                                  ),
                                                ),
                                              ],
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
                              flex: 1,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Container(
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
                                                    child: Text("التغليف",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text("   بدون تغليف",
                                                  style: TextStyle(
                                                      color: GoodColors.brownDark
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
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
                                        padding: EdgeInsets.all(6),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: GoodColors.brownDark,
                                            borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: Center(
                                            child: Text("سعر هذا الطلب : 150 ريال",
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
    );
  }

}