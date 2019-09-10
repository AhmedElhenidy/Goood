import 'package:camel/DataBase/SqliteDataBase.dart';
import 'package:camel/DataBase/config.dart';
import 'package:camel/statics/DataBaseConstants.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:camel/ui/zabaeh.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:sqlcool/sqlcool.dart';

import 'hashy.dart';
class Likes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LikesState();
  }
}
class _LikesState extends State<Likes>{
  SelectBloc bloc ;
  @override
  void initState() {
    super.initState();
    bloc = SelectBloc(
        database: db ,
        table: DataBaseConstants.WISH_LIST_TABLE,
        columns: "${DataBaseConstants.WISH_LIST_TABLE}.${DataBaseConstants.WISH_LIST_TABLE_ID} as id , "
            "${DataBaseConstants.WISH_LIST_TABLE}.${DataBaseConstants.WISH_LIST_TABLE_PRODUCT_ID} as productId , "
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_IMAGE} as image ,"
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_NAME} as name ,"
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_PRICE} as price ,"
            "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_CATEGORY} as category",

        joinTable: DataBaseConstants.PRODUCT_TABLE,
        joinOn: "${DataBaseConstants.PRODUCT_TABLE}.${DataBaseConstants.PRODUCT_TABLE_ID} = ${DataBaseConstants.WISH_LIST_TABLE}.${DataBaseConstants.WISH_LIST_TABLE_PRODUCT_ID}",
        reactive: true
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: StreamBuilder<List<Map>>(
            stream: bloc.items,
            builder: (context, snapshot) {
              return !snapshot.hasData ? Center(child: CircularProgressIndicator(),): ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,position){
                  var product = snapshot.data[position];
                  return InkWell(
                    onTap: (){
                      if(product['category'] == 1 ){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Hashy(product['productId'])));
                      }else if (product['category'] == 2 ){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Zbaeh(product['productId'])));
                      }
                    },
                    child: Padding(
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
                                  child: Image.asset(product[DataBaseConstants.PRODUCT_TABLE_IMAGE],fit: BoxFit.fill,),
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
                                            Text(product[DataBaseConstants.PRODUCT_TABLE_NAME],
                                              style: TextStyle(
                                                color:GoodColors.brown ,
                                                fontSize: 18,
                                                fontFamily: 'black75',
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(2),
                                              decoration:BoxDecoration(
                                                color: GoodColors.brownLight,
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: LikeButton(
                                                isLiked: true ,
                                                onTap: (isLiked) async{
                                                  return await SqlLiteDataBase.addOrRemoveWishList(product['productId']);
                                                },
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
                                                    style: TextStyle(fontSize: 16,fontFamily: 'bold65',),
                                                  ),
                                                  Text(" ${product[DataBaseConstants.PRODUCT_TABLE_PRICE]} ر.س ",
                                                    style: TextStyle(
                                                      fontFamily: 'bold65',
                                                    ),
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
                                                    Text("    اطلب الآن   ",style: TextStyle(fontFamily: 'bold65',),),
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
                      ),
                    ),
                  );
                },
              );
            }
          ),
        ),
      ),

    );
  }
}