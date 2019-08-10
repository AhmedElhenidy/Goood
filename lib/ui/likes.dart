import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
class Likes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LikesState();
  }
}
class _LikesState extends State<Likes>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context,position){
              return Padding(
                padding: const EdgeInsets.only(bottom:16.0),
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
                                      padding: EdgeInsets.all(2),
                                      decoration:BoxDecoration(
                                        color: GoodColors.brownLight,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: LikeButton(
                                        circleColor: CircleColor(start: Colors.white, end:GoodColors.brown),
                                        likeBuilder: (widget) {
                                          return Container(
                                            child:  !widget ?Icon(Icons.favorite_border,color:Colors.white,):
                                            Icon(Icons.favorite,color:GoodColors.brownDark,),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right:4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 137,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(6),
                                          bottomLeft: Radius.circular(6),
                                          bottomRight: Radius.circular(6),
                                          topRight: Radius.circular(6),
                                        ),
                                        border: Border.all(
                                            color: GoodColors.brown
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(6),
                                                bottomRight: Radius.circular(6),
                                              ),
                                              color: GoodColors.brownLight,
                                            ),
                                            child: Icon(
                                              Icons.attach_money,color: GoodColors.brownDark,
                                              size: 28,
                                            ),
                                          ),
                                          Text(" السعر ",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(" 150 ر.س ",
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right :4.0,top: 8),
                                child: InkWell(
                                  onTap: (){},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        width: 137,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            color: GoodColors.brown
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(Icons.shopping_cart,color: Colors.white,),
                                            Text("    اطلب الآن   "),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        flex: 2,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),

    );
  }
}