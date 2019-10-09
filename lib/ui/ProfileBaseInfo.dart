import 'dart:io';

import 'package:camel/Api/ClientApi.dart';
import 'package:camel/model/User.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:camel/statics/snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:permission/permission.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ProfileBaseInfo extends StatefulWidget {
  ProfileBaseInfo({Key key}) : super(key: key);

  @override
  _ProfileBaseInfoState createState() {
    return _ProfileBaseInfoState();
  }
}

class _ProfileBaseInfoState extends State<ProfileBaseInfo> {
  User user ;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>() ;


  @override
  void initState() {
    super.initState();

    getUser().then((user){
      setState(() {
        this.user = user ;
        this.phone.text = this.user?.phone??"" ;
        this.password.text = "*******" ;
        this.name.text = this.user?.name??"";
        this.email.text = this.user?.email??"";
      });
      if(this.user.latLng.isNotEmpty && this.user.latLng != null){
        this.getAddress(new LatLng(double.parse(user.latLng.split(",")[0]) , double.parse(user.latLng.split(",")[1])));
      }else{
        setState(() {
          this.address.text ="لم يتم تحديد اي موقع اضغط للتحديد";
        });
      }
    });
  }

  void getAddress(LatLng latLng)async{
    var address = await Geocoder.local.findAddressesFromCoordinates(new Coordinates(latLng.latitude, latLng.longitude)) ;

    setState(() {
      this.address.text = address.first.addressLine ;
    });
  }

  bool registerApi = false;
//  editUserInfo() {
//      setState(() {
//        this.registerApi = true;
//      });
//      ClientApi.editUserInfo(this.user.id, name.text, email.text,phone.text).then((response) {
//        if (!response.errors) {
//          saveUser(response.user).then((done) {
//
//          }, onError: (error) {
//            print("edite user Error : :  :$error");
//          });
//        } else {
//          showInSnackBar("${response.message_ar}", context, _scaffoldKey);
//        }
//        setState(() {
//          this.registerApi = false;
//        });
//      }, onError: (error) {
//        print("edit user   Error : : :$error");
//        setState(() {
//          this.registerApi = false;
//        });
//      });
//  }

  @override
  void dispose() {
    super.dispose();
  }
  TextEditingController address = new TextEditingController() ;
  TextEditingController name = new TextEditingController() ;
  TextEditingController email = new TextEditingController() ;
  TextEditingController phone = new TextEditingController() ;
  TextEditingController password = new TextEditingController() ;
  FocusNode nameFocus = new FocusNode();
  
  bool editing = false ; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar:PreferredSize(
         preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height/3),
        child: Container(
          child: Stack(
            children: <Widget>[
             Positioned(
                 top: 0,
                 left: 0,
                 right: 0,
                 bottom: (MediaQuery.of(context).size.height/3)- 90,
                 child: Container(
                   color: GoodColors.brown,
                   child: Column(
                     children: <Widget>[
                       Flexible(child: Container(
                         padding: EdgeInsets.only(top: 20 , left: 16 ,right: 16),
                         child: Row(
                           children: <Widget>[
                             Expanded(child: InkWell(
                               onTap: (){
                                 Navigator.pop(context);
                               },
                               child: Container(
                                    child: Center(
                                      child: Icon(Icons.arrow_back ,size: 40 , color: Colors.white,),
                                    ),
                               ),
                             ) , flex: 1,),
                             Expanded(child: Container(
                             ) , flex: 3,),
                             Expanded(child: InkWell(
                               onTap: (){
                                 setState(() {
                                   if(this.editing){
//                                     this.editUserInfo();
                                   }
                                   this.editing = !this.editing ;
                                   FocusScope.of(context).requestFocus(this.nameFocus);
                                 });
                               },
                               child: Container(
                                 child: Center(
                                   child: Container(
                                     width: 670,
                                     height: 30,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(20),
                                         border: Border.all(color: Colors.white ,width: 2),
                                       color: this.editing ? GoodColors.brownLight : GoodColors.brown
                                     ),
                                     child: Center(
                                       child: this.registerApi ? Container(height:20  , width: 20 , child: Center(child: CircularProgressIndicator(),),): Text(this.editing ? "حفظ": "تعديل" ,style: TextStyle(color: Colors.white),),
                                     ),
                                   ),
                                 ),
                               ),
                             ) , flex: 1,),
                           ],
                         ),
                       ) ,flex:2 ,),
                       Flexible(child: Container(
                       ) ,flex:1 ,),
                     ],
                   ),
                 )),
              Positioned(
                 top: 70,
                 left: 0,
                 right: 0,
                 bottom: 0,
                 child: Container(
                   child: Column(
                     children: <Widget>[
                       Flexible(child: Container(

                         child: Align(
                           alignment: Alignment.topCenter,
                           child: InkWell(
                             onTap: (){
//                               getImage();
                             },
                             child: Container(
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 border: Border.all(
                                   color: Colors.white ,
                                   width: 2
                                 )
                               ),
                               height: 100,
                               width: 100,
                               child: CircleAvatar(
                                 backgroundImage:AssetImage("images/man.png"),
                               ),
                             ),
                           ),
                         ),
                       ) ,flex:1 ,),
                       Flexible(child: Container(
                         child: Column(
                           children: <Widget>[
                             SizedBox(height: 10,),
                             Text(name.text , style: TextStyle(color: Colors.black , fontSize: 20 ,fontWeight: FontWeight.bold),),
                             SizedBox(height: 10,),
                             Container(color: Colors.grey, width: 100, height: 1 ,)
                           ],
                         ),
                       ) ,flex:1 ,),
                     ],
                   ),
                 )),
            ],
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 16 ,right: 16),
            child: Column(
              children: <Widget>[
                Container(
                  height: 60,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 0,
                        child: Container(
                          padding:EdgeInsets.only(left: 16 ,right: 16),
                          constraints: BoxConstraints(
                            minHeight: 50
                          ),
                          width: MediaQuery.of(context).size.width-32,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1 ,color: GoodColors.brown),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: TextField(
                            enabled: editing,
                            controller:name,
                            focusNode: nameFocus,
                            decoration: InputDecoration(
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 16,
                        child: Container(
                          height: 20,
                          width: 70,
                          decoration: BoxDecoration(
                            color: GoodColors.brown,
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text("الاسم",style: TextStyle(fontSize: 12 ,color:Colors.white ),),
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 21,),
                Container(
                  height: 60,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 0,
                        child: Container(
                          padding:EdgeInsets.only(left: 16 ,right: 16),
                          constraints: BoxConstraints(
                              minHeight: 50
                          ),
                          width: MediaQuery.of(context).size.width-32,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1 ,color: GoodColors.brown),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: TextField(
                            enabled: editing,
                            controller:email,
                            decoration: InputDecoration(
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 16,
                        child: Container(
                            height: 20,
                            width: 80,
                            decoration: BoxDecoration(
                              color: GoodColors.brown,
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text("البريد الالكتروني",style: TextStyle(fontSize: 10 ,color:Colors.white ),),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 21,),
                Container(
                  height: 60,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 0,
                        child: Container(
                          padding:EdgeInsets.only(left: 16 ,right: 16),
                          constraints: BoxConstraints(
                              minHeight: 50
                          ),
                          width: MediaQuery.of(context).size.width-32,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1 ,color: GoodColors.brown),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: TextField(
                            enabled: editing,
                            controller:phone,
                            decoration: InputDecoration(
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 16,
                        child: Container(
                            height: 20,
                            width: 80,
                            decoration: BoxDecoration(
                              color: GoodColors.brown,
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text("رقم الجوال",style: TextStyle(fontSize: 12 ,color:Colors.white ),),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 21,),
                Container(
                  height: 60,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 0,
                        child: Container(
                          padding:EdgeInsets.only(left: 16 ,right: 16),
                          constraints: BoxConstraints(
                              minHeight: 50
                          ),
                          width: MediaQuery.of(context).size.width-32,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1 ,color: GoodColors.brown),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: TextField(
                            enabled: editing,
                            controller:password,
                            decoration: InputDecoration(
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 16,
                        child: Container(
                            height: 20,
                            width: 70,
                            decoration: BoxDecoration(
                              color: GoodColors.brown,
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text("كلمة السر",style: TextStyle(fontSize: 12 ,color:Colors.white ),),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 21,),
                Container(
                  height: 70,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 0,
                        child: Container(
                          padding:EdgeInsets.only(left: 16 ,right: 16),
                          constraints: BoxConstraints(
                              minHeight: 50
                          ),
                          width: MediaQuery.of(context).size.width-32,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1 ,color: GoodColors.brown),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: TextField(
                            enabled: editing,
                            maxLines:2,
                            minLines: 2,
                            controller:address,
                            decoration: InputDecoration(
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 16,
                        child: Container(
                            height: 20,
                            width: 70,
                            decoration: BoxDecoration(
                              color: GoodColors.brown,
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text("العنوان",style: TextStyle(fontSize: 12 ,color:Colors.white ),),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 21,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}