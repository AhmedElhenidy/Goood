import 'package:camel/model/OrderModel.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClientTab extends StatefulWidget{
  Order order;
  ClientTab(this.order);
  _ClientTabState createState()=>_ClientTabState();
}
class _ClientTabState extends State<ClientTab>{

  String address = "" ;
  void getAddress(LatLng latLng)async{
    var address = await Geocoder.local.findAddressesFromCoordinates(new Coordinates(latLng.latitude, latLng.longitude)) ;
    setState(() {
      this.address = address.first.addressLine ;
    });

  }
  @override
  void initState() {
    super.initState();

   if(double.tryParse(widget.order.address.split(",")[0]) == null || widget.order.address.split(",").length < 2){
     print("parseing : null");
    setState(() {
      this.address = widget.order.address ;
    });
   }else{
     print("parseing : not null");
    this.getAddress(new LatLng(double.parse(widget.order.address.split(",")[0]) ,double.parse(widget.order.address.split(",")[1] ))) ;
   }
  }

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
                        child: Text("${widget.order.name}",
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
                                    child: Text("${this.address}",
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
                                    child: Text("${widget.order.phone_1}",
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
                                    child: Text("${widget.order.note}",
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
                                onTap: (){
                                  _launchURL("tel:${widget.order.phone_1}");

                                },
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
//                          Expanded(
//                            flex: 1,
//                            child: Padding(
//                              padding: const EdgeInsets.only(right:8.0),
//                              child: InkWell(
//                                child: Container(
//                                  padding: EdgeInsets.only(top: 4,bottom: 4),
//                                  decoration: BoxDecoration(
//                                      color: GoodColors.brownDark,
//                                      borderRadius: BorderRadius.circular(7)
//                                  ),
//                                  child: Row(
//                                    mainAxisAlignment: MainAxisAlignment.center,
//                                    children: <Widget>[
//                                      Text("مراسلة   ",
//                                        style: TextStyle(
//                                          color: Colors.white,
//                                        ),
//                                      ),
//                                      Image.asset("images/whatsapp.png",width: 24,height: 24,)
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ),
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

  _launchURL(String url ) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}