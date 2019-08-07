import 'package:camel/statics/good_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Cupertino extends StatefulWidget{
  _CupertinoState createState()=> _CupertinoState();
}
class _CupertinoState extends State<Cupertino>{
  String text = "click";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FlatButton(
          onPressed: () async {
            await showCupertinoModalPopup <void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height/2.7,
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: GoodColors.brownDark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Text("الحجم",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: CupertinoPicker(
                          onSelectedItemChanged: (int i){print(i);
                            setState(() {
                              text=i.toString();
                            });
                          },
                          backgroundColor: CupertinoColors.white,
                          itemExtent: 70,
                          children: <Widget>[
                            Center(
                              child: Text("صغير",
                                style: TextStyle(
                                  color: GoodColors.brown,
                                ),
                              ),
                            ),
                            Center(
                              child: Text("متوسط",
                                style: TextStyle(
                                  color: GoodColors.brown,
                                ),
                              ),
                            ),
                            Center(
                              child: Text("كبير",
                                style: TextStyle(
                                  color: GoodColors.brown,
                                ),
                              ),
                            ),
                            Center(
                              child: Text("جبر",
                                style: TextStyle(
                                  color: GoodColors.brown,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Text(text),
        ),
      ),
    );
  }
}
