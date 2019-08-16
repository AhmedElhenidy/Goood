import 'package:camel/admin/statics/admin_app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
class Offers extends StatefulWidget {
  _OffersState createState() => _OffersState();
}
class _OffersState extends State<Offers>{
  GlobalKey<ScaffoldState> _scaffoldKeyProfile ;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile =GlobalKey<ScaffoldState>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBarClass().appBar(context, _scaffoldKeyProfile,"العروض"),
      body: Container(
        padding: EdgeInsets.only(top: 16,bottom: 16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left :16,right: 16,top: 8,bottom: 8),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("العدد : 3 صور"),
                    Text("الحجم : 148 * 312 "),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                child: Image.asset("images/add_photo.png",fit: BoxFit.fill,),
              ),
            ),
            Flexible(
              flex: 7,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  padding: EdgeInsets.only(bottom: 16,right: 16,left: 16),
                  itemCount: 3,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    childAspectRatio: 1.7
                  ),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,position){
                    return Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: MediaQuery.of(context).size.height/7,
                              color: Colors.green,
                              child: Image.asset("images/caro1.png",fit: BoxFit.fill,),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Container(
                              height: MediaQuery.of(context).size.height/7,
                              child: Column(
                                children: <Widget>[
                                  Flexible(
                                    flex: 1,
                                    child: InkWell(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: GoodColors.brownLight,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(7),
                                          )
                                        ),
                                        child: Center(
                                          child: Icon(Icons.edit,color: Colors.white,),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: GoodColors.brownDark,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(7),
                                          )
                                      ),
                                      child: Center(child: Icon(Icons.delete,color: Colors.white,)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}