import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
class ClientTab extends StatefulWidget{
  _ClientTabState createState()=>_ClientTabState();
}
class _ClientTabState extends State<ClientTab>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            bottom: 30,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 16,bottom: 4),
                        child: Text("Mohamed Saafan",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(top: 4,bottom: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
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
                                    child: Text("العنوان",
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(right :16.0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text("جدة، شارع الأدهم عمارة 115",
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
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(top: 4,bottom: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
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
                                    child: Text("الهاتف",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(right :16.0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text("01009081658",
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
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(top: 4,bottom: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          color: GoodColors.brownLight,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: EdgeInsets.only(right: 16,left: 16,top: 4,bottom: 4),
                                    decoration: BoxDecoration(
                                      color: GoodColors.brownDark,
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                    child: Text("الملحوظة",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(right :16.0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text("جدة، شارع  عمارة 115",
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
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(right: 16,left: 16),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left :8.0),
                              child: InkWell(
                                child: Container(
                                  padding: EdgeInsets.only(top: 4,bottom: 4),
                                  decoration: BoxDecoration(
                                    color: GoodColors.brownDark,
                                    borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("اتصال   ",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Image.asset("images/call-answer.png",width: 18,height: 18,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: InkWell(
                                child: Container(
                                  padding: EdgeInsets.only(top: 4,bottom: 4),
                                  decoration: BoxDecoration(
                                      color: GoodColors.brownDark,
                                      borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("مراسلة   ",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Image.asset("images/whatsapp.png",width: 24,height: 24,)
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
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width/4,
            right: MediaQuery.of(context).size.width/4,
            child: Container(
               height: 90,
              child: Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width/7.5,
                  backgroundColor:GoodColors.brown,
                  child: Image.asset("images/man.png",fit: BoxFit.fill,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}