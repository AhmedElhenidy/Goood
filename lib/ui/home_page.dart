import 'package:camel/statics/good_colors.dart';
import 'package:camel/ui/slices.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}
class _HomePageState extends State<HomePage>{
  int _current = 0;
  GlobalKey<ScaffoldState> _scaffoldKeyProfile ;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile =new GlobalKey<ScaffoldState>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top :8.0,bottom: 16),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider(
                      items: [
                        Container(
                          child: Image.asset("images/caro1.png",fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          child: Image.asset("images/caro2.png",fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          child: Image.asset("images/caro3.png",fit: BoxFit.fill,
                          ),
                        ),
                      ],
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                      pauseAutoPlayOnTouch: Duration(seconds: 5),
                      onPageChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right :16.0),
                        child: Row(
                          children: <Widget>[
                            Image.asset("images/category.png",width: 24,height: 24,),
                            Text("  الأقسام",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          //الحاشى
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left:16.0,bottom: 10,right: 16),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Slices()));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(17),
                                  child: Container(
                                    height:MediaQuery.of(context).size.height/2.9,
                                    color: Colors.white,
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          bottom: 0,left: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7),
                                              color: GoodColors.brown,
                                            ),
                                            width: MediaQuery.of(context).size.width/1.5,
                                            height: MediaQuery.of(context).size.height/5,
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,right: -2,
                                          child: CircleAvatar(
                                            radius: MediaQuery.of(context).size.width/4.7,
                                            backgroundColor: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.all(16),
                                              child: Center(
                                                child: Image.asset("images/camel.png"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 15,
                                          right: MediaQuery.of(context).size.width/24,
                                          left: MediaQuery.of(context).size.width/24,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.topCenter,
                                                child: Text("قسم الحاشى",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left:16.0,bottom: 16,right: 16),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Slices()));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(17),
                                  child: Container(
                                    height:MediaQuery.of(context).size.height/2.95,
                                    color: Colors.white,
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          bottom: 0,left: 0,
                                          child: Container(
                                            color: GoodColors.brown,
                                            width: MediaQuery.of(context).size.width/1.5,
                                            height: MediaQuery.of(context).size.height/5,
                                          ),
                                        ),
                                        Positioned(
                                          top: -1,right: -2,
                                          child: CircleAvatar(
                                            radius: MediaQuery.of(context).size.width/4.7,
                                            backgroundColor: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.all(16),
                                              child: Center(
                                                child: Image.asset("images/cheap1.png"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 15,
                                          right: MediaQuery.of(context).size.width/24,
                                          left: MediaQuery.of(context).size.width/24,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.topCenter,
                                                child: Text("قسم الذبائح",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
            ],
          ),
        ),
    );
  }
}