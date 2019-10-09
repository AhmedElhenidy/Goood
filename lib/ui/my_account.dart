import 'package:camel/Api/ClientApi.dart';
import 'package:camel/DataBase/SqliteDataBase.dart';
import 'package:camel/model/User.dart';
import 'package:camel/statics/drawer.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:camel/ui/GetLocation.dart';
import 'package:camel/ui/ProfileBaseInfo.dart';
import 'package:camel/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'UserOrders.dart';

class MyAccount extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAccountState();
  }
}
class _MyAccountState extends State<MyAccount>{
  int count = 0;
  void didChangeDependencies() {
    super.didChangeDependencies() ;
    SqlLiteDataBase.getShoppingCartCount().then((count){
      setState(() {
        this.count = count ;
      });
    });
  }
  bool getAllOrdersApiCall =false ;
  double price = 0.0 ;
  getAllOrders(){
    setState(() {
      getAllOrdersApiCall=true;
    });
    ClientApi.getUserOrder().then((response){
      price = 0.0 ;
      setState(() {
        getAllOrdersApiCall=false;
      });
      response.orderList.forEach((order){
        setState(() {
          this.price+= double.parse(order.price);
        });
      });
    },onError: (error){
      print("get All orders erorr ::  $error");
      setState(() {
        getAllOrdersApiCall=false;
      });
    });
  }
  User user ;
  GlobalKey<ScaffoldState> _globalKeyScafoldState;
  bool isLocationSet = false ;
  @override
  void initState() {
    getAllOrders() ;
    super.initState();
    _globalKeyScafoldState =GlobalKey<ScaffoldState>();

    getUser().then((user){
      setState(() {
        this.user = user ;
      });
      if(user.latLng != null)
        setState(() {
          this.isLocationSet = true ;
        });
      else
        setState(() {
          this.isLocationSet = false ;
        });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKeyScafoldState,
      drawer: DrawerClass().showDrawer(context),
      body:InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
        },
        child: this.user?.id == null ? Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Padding(
                padding: EdgeInsets.only(left: 16 ,right: 16),
              child: Container(height: 50,
              decoration: BoxDecoration(
                color: GoodColors.brown,
                borderRadius: BorderRadius.circular(25),
                
              ),
                child: Center(
                  child: Text("ليس لديك حساب قم بتسجيل الدخول اولا " , style:TextStyle(color: Colors.white , fontSize: 20 ,fontWeight: FontWeight.bold) ,),
                ),
              ),
            ),
          ),
        ):  SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width/1.5,
                child: Column(
                  children: <Widget>[
                    Image.asset("images/man.png"),
                    SizedBox(height: MediaQuery.of(context).size.height/50,),
                    Text("${this.user.name}",
                      style: TextStyle(color: GoodColors.brown,fontSize: 25,
                        fontFamily: 'bold65',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top :16.0),
                child: Container(
                  padding: EdgeInsets.only(top: 16,bottom: 16),
                  width: MediaQuery.of(context).size.width/1.4,
                  decoration: BoxDecoration(
                    color: GoodColors.brownLight,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top:4,bottom: 4,right: 16,left: 16),
                            decoration: BoxDecoration(
                              color: GoodColors.brownDark,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18),
                                bottomLeft: Radius.circular(18),
                              ),
                            ),
                            child: Text("إجمالى الطلبات",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'black75',
                              ),
                            ),
                          ),
                        ],
                      ),
                      getAllOrdersApiCall ? Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ): Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("$price",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: GoodColors.brown,
                              fontSize: 50,
                              fontFamily: 'black75',
                            ),
                          ),
                          Text(" ر.س ",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                height: 2,
                              fontFamily: 'black75',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top :16.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileBaseInfo()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 2,bottom: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: GoodColors.brownLight,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset("images/info.png",width: 38,height: 38,),
                        Padding(
                          padding: const EdgeInsets.only(right:16.0),
                          child: Text("المعلومات الشخصية  ",
                            style: TextStyle(
                              fontSize: 16,
                              color: GoodColors.brown,
                              fontFamily: 'bold65',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top :16.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserOrders()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 2,bottom: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: GoodColors.brownLight,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset("images/shopping_cart.png",width: 38,height: 38,),
                        Padding(
                          padding: const EdgeInsets.only(right:16.0),
                          child: Text("الطلبات السابقة  ",
                            style: TextStyle(
                              fontSize: 16,
                              color: GoodColors.brown,
                              fontFamily: 'bold65',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top :16.0),
                child: InkWell(
                  onTap: ()async{
                    LatLng resposne = await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GetLocation()));
                    if(resposne != null) {
                      user.latLng = "${resposne.latitude},${resposne.longitude}";
                      saveUser(user).then((done) {
                        setState(() {
                          this.isLocationSet = true;
                        });
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 2,bottom: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: GoodColors.brownLight,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset("images/location.png",width: 38,height: 38,),
                        Padding(
                          padding: const EdgeInsets.only(right:16.0),
                          child: Text("عنواني  ",
                            style: TextStyle(
                              fontSize: 16,
                              color: GoodColors.brown,
                              fontFamily: 'bold65',
                            ),
                          ),
                        ),
                        !isLocationSet ? Container(): SizedBox(width: MediaQuery.of(context).size.width/2,),
                        !isLocationSet ? Container(): Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green
                            ),

                            child: Center(child: Icon(Icons.check ,color: Colors.white, size: 15,))),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top :16.0),
                child: InkWell(
                  onTap: (){
                    clear(); 
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 2,bottom: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: GoodColors.brownLight,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset("images/info.png",width: 38,height: 38,),
                        Padding(
                          padding: const EdgeInsets.only(right:16.0),
                          child: Text("تسجيل الخروج ",
                            style: TextStyle(
                              fontSize: 16,
                              color: GoodColors.brown,
                              fontFamily: 'bold65',
                            ),
                          ),
                        ),
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
  }
}