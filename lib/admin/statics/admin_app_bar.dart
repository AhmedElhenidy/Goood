import 'package:camel/statics/good_colors.dart';
import 'package:camel/ui/snap_chat.dart';
import 'package:flutter/material.dart';
class AdminAppBarClass{
  int count = 0 ;
  Widget appBar(BuildContext context , GlobalKey<ScaffoldState> _scaffoldKeyProfile,String title){
    return AppBar(
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
              Text('$title',
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
    );
  }

}