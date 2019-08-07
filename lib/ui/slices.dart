import 'package:camel/statics/app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
class Slices extends StatefulWidget{
  _SlicesState createState()=> _SlicesState();
}
class _SlicesState extends State<Slices>{
  GlobalKey<ScaffoldState> _scaffoldKeyProfile;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile = new GlobalKey<ScaffoldState>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarClass().appBar(context, _scaffoldKeyProfile),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 8,right: 8,bottom: 16),
        color: Colors.white,
        child: GridView.count(
          padding: EdgeInsets.only(top : 16 ,right: 8 , left: 8 , bottom: 16),
         mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          crossAxisCount: 2,
          childAspectRatio: (MediaQuery.of(context).size.width/2 -32)/(MediaQuery.of(context).size.height/3.5),
          children :  List.generate(4, (index) {
            return Container(
              height: MediaQuery.of(context).size.height/2.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: MediaQuery.of(context).size.width/3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(flex:3,
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,right: 0,left: 0,bottom: 0,
                                child: Image.asset("images/cheap.png",fit: BoxFit.fill,),
                              ),
                              Positioned(
                                top: 8,left: 8,
                                child: LikeButton(
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex:2,
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: Text("نعيمى",
                                  style: TextStyle(
                                      fontSize: 18,color: GoodColors.brown
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.monetization_on),
                                    Text(" 150 ",
                                      style: TextStyle(
                                        fontSize: 18,color: GoodColors.brown
                                      ),
                                    ),
                                    Text("رس "),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex:1,
                        child: InkWell(
                          child: Container(
                            padding: EdgeInsets.only(top: 4,bottom: 4),
                            color: GoodColors.brown,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("اطلب الآن ",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(Icons.shopping_cart,color: Colors.white,),
                              ],
                            ),
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
    )
    );
  }


}