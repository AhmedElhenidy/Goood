import 'package:camel/statics/good_colors.dart';
import 'package:camel/ui/snap_chat.dart';
import 'package:flutter/material.dart';
class AppBarClass{
  int count = 0 ;
  Widget appBar(BuildContext context , GlobalKey<ScaffoldState> _scaffoldKeyProfile,{String title}){
    return AppBar(
      backgroundColor: GoodColors.brown,
      actions: <Widget>[
        Container(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              //MediaQuery.of(context).size.width/8,),
              Expanded(
                flex: 3,
                child: Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: title==null ?
                    Text('الجــود',
                      style: TextStyle(
                        fontSize:20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ):title=="logo" ?Container(
                      child: Image.asset("images/logo.png",width: 50,height: 50,),
                    ):Text('$title',
                      style: TextStyle(
                        fontSize:20.0,
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
                          InkWell(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SnapChat()));
                            },
                            child: Container(
                              child: Image.asset("images/snapshat.png",width: 35,height: 35,),
                            ),
                          ),
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
              ),
            ],
          ),
        ),
      ],
    );
  }

}