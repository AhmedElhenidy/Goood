import 'dart:async';

import 'package:camel/admin/api/driver_api.dart';
import 'package:camel/admin/model/driver.dart';
import 'package:camel/admin/statics/admin_app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';

class Drivers extends StatefulWidget {
  _DriversState createState() => _DriversState();
}
class _DriversState extends State<Drivers>{
  int position =0;
  static StreamController notifier = new StreamController.broadcast();
  static StreamController notifier2 = new StreamController.broadcast();
  static StreamController notifier3 = new StreamController.broadcast();
  final Stream trigger = notifier.stream ;
  final Stream trigger2 = notifier2.stream ;
  final Stream trigger3 = notifier3.stream ;
  StreamSubscription subscription ;
  StreamSubscription subscription2 ;
  StreamSubscription subscription3;
  GlobalKey<ScaffoldState> _scaffoldKeyProfile ;
  static List<Driver> driverList = new List();
  bool getAllUsersApiCall = false ;
  getAllDrivers(){
    setState(() {
      getAllUsersApiCall = true ;
    });
    DriverApi.getAllDriver().then((response){
      setState(() {
        driverList =response.driverList;
        getAllUsersApiCall = false ;
      });
    },onError: (error){
      setState(() {
        getAllUsersApiCall = false ;
      });
      print("get All drivers error : : : $error");
    });
  }
  deleteDriver(int id,int position){
    setState(() {
      getAllUsersApiCall =true;
    });
    DriverApi.deleteDriver(id).then((response){
      this.getAllDrivers();
    });
  }
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile =GlobalKey<ScaffoldState>();
    getAllDrivers();
    subscription =  trigger.listen((i){
     setState(() {
       driverList.add(i);
     });
    });
    subscription2 =  trigger2.listen((i){
     setState(() {
       print("posion::   $position");
       driverList[position]=i;
     });
    });
    subscription3 =  trigger3.listen((i){
      print("posion::   $position");
     setState(() {
       driverList.removeAt(i);
     });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBarClass().appBar(context, _scaffoldKeyProfile,"السائقون"),
      body: getAllUsersApiCall
          ?Center(child:
      CircularProgressIndicator(
        backgroundColor: GoodColors.brownDark,
      ),
      )
          :Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("العدد :  ${driverList.length} سائق"),
                    InkWell(
                      onTap: (){
                        showDialog(context: context,
                          builder: (context)=>AddDriver()
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 16,left: 16),
                        decoration: BoxDecoration(
                          color: GoodColors.brownLight,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Center(
                          child: Text("+ إضافة سائق",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 12,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 16,right: 16),
                  itemCount: driverList.length,
                  itemBuilder: (context,position){
                    return Padding(
                      padding: const EdgeInsets.only(bottom:16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: (){
                            this.position =position;
                            showDialog(context: context,
                              builder: (context)=>DriverInfo(position,driverList[position].id,"${driverList[position].name}","${driverList[position].phone}","لا توجد ملاحظات")
                            );
                          },
                          child: Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Center(child: Text("${position+1}")),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: Center(
                                      child: CircleAvatar(
                                        radius: 28,
                                        backgroundColor: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Image.asset("images/driver_pic.png"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Flexible(
                                          flex: 1,
                                          fit: FlexFit.tight,
                                          child: Container(
                                            padding: EdgeInsets.only(right: 2,top: 14),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                                child: Text("${driverList[position].name}",style: TextStyle(fontSize: 18),)),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          fit: FlexFit.tight,
                                          child: Container(
                                            padding: EdgeInsets.only(right: 8,left: 8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Text("${driverList[position].phone}",style: TextStyle(fontSize: 12),),
                                                Image.asset("images/whats.png",width:20,height: 20 ,),
                                                Image.asset("images/ring.png",width:20,height: 20 ,),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Flexible(
                                          flex: 1,
                                          child: InkWell(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: GoodColors.brownLight,
                                              ),
                                              child: Center(
                                                child: Icon(Icons.edit,color: Colors.white,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: (){
                                              deleteDriver(driverList[position].id,position);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: GoodColors.brownDark,
                                              ),
                                              child: Center(child: Icon(Icons.delete,color: Colors.white,)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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

class AddDriver extends StatefulWidget{
  _AddDriverState createState()=> _AddDriverState();
}
class _AddDriverState extends State<AddDriver> {
  TextEditingController name ,phone ,note ;
  bool addDriverApiCal =false ;
  addDriver(BuildContext context) async{
    setState(() {
      addDriverApiCal =true ;
    });
    DriverApi.addNewDriver(name.text, phone.text,note.text).then((response){
        if(!response.errors){
          _DriversState.notifier.sink.add(response.driver);
        }
        setState(() {
          addDriverApiCal =false ;
        });
        Navigator.pop(context);
      },onError: (error){
        setState(() {
          addDriverApiCal =false ;
        });
        print("Add Driver error : : $error");
      });
  }
  @override
  void initState() {
    super.initState();
    name =TextEditingController();
    phone =TextEditingController() ;
    note =TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(8)
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 16),
          height: MediaQuery.of(context).size.height/1.8,
          child: addDriverApiCal?Center(child: CircularProgressIndicator(),):Column(
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child:
                  Column(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Center(
                          child: Text("إضافة سائق",
                            style: TextStyle(
                              color: GoodColors.brown,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: GoodColors.greyLight,
                            height: 3,
                            width: MediaQuery.of(context).size.width/2.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 2,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Image.asset("images/add_driver_photo.png"),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight ,
                        flex: 1,
                        child: Text("الصورة الشخصية",
                          style: TextStyle(
                            color: GoodColors.brown,
                            fontSize: 18
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 6,
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: name.text!=""&&phone.text!=""?GoodColors.brownDark:GoodColors.greyLight,
                          ),
                        ),
                        child: TextField(
                          controller: name,
                          style: TextStyle(
                            height: .5,
                          ),
                          decoration: InputDecoration(
                            icon: Icon(Icons.person,color:name.text!=""&&phone.text!=""?GoodColors.brownDark: Colors.grey,),
                            hintText: "اسم السائق",
                            hintStyle: TextStyle(
                              color: GoodColors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: name.text!=""&&phone.text!=""?GoodColors.brownDark:GoodColors.greyLight,
                          ),
                        ),
                        child: TextField(
                          controller: phone,
                          style: TextStyle(
                            height: .5,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            icon: Icon(Icons.phone,color: name.text!=""&&phone.text!=""?GoodColors.brownDark:Colors.grey,),
                            hintText: "رقم السائق",
                            hintStyle: TextStyle(
                              color: GoodColors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: name.text!=""&&phone.text!=""?GoodColors.brownDark:GoodColors.greyLight,
                          ),
                        ),
                        child: TextField(
                          controller: note,
                          minLines: 4,
                          maxLines: 4,
                          style: TextStyle(
                            height: 1,
                          ),
                          decoration: InputDecoration(
                            icon: Icon(Icons.speaker_notes,color: name.text!=""&&phone.text!=""?GoodColors.brownDark:Colors.grey,),
                            hintText: "إضافة ملحوظة",
                            hintStyle: TextStyle(
                              color: GoodColors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right :8.0,left: 8,top: 2,bottom: 2),
                    child: InkWell(
                      onTap:(){
                        addDriver(context);
                      } ,
                      child: Container(
                        decoration: BoxDecoration(
                          color: name.text!=""&&phone.text!=""?GoodColors.brownDark:GoodColors.greyLight,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(
                          child: Text("حفظ",
                            style: TextStyle(
                              fontSize: 16,
                              color: name.text!=""&&phone.text!=""?GoodColors.brownLight:GoodColors.grey,
                            ),
                          ),
                        ),
                      ),
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

class DriverInfo extends StatefulWidget{
  int id ,position;
  String name ,phone ,note;
  DriverInfo(this.position,this.id,this.name,this.phone,this.note);
  _DriverInfoState createState()=> _DriverInfoState();
}
class _DriverInfoState extends State<DriverInfo> {
  TextEditingController name ,phone ,note ;
  bool updateDriverApiCall =false ;
  updateDriver(BuildContext context){
    setState(() {
      updateDriverApiCall =true ;
    });
    DriverApi.updateDriver(widget.id, name.text, phone.text, note.text).then((response){
      if(!response.errors){
        _DriversState.notifier2.sink.add(response.driver);
      }
     setState(() {
       updateDriverApiCall =false ;
     });
      Navigator.pop(context);
    },onError: (error){
      setState(() {
        updateDriverApiCall =false ;
      });
      print("Update driver error : : $error");
    });
  }
  deleteDriver(BuildContext context){
    setState(() {
      updateDriverApiCall =true ;
    });
    DriverApi.deleteDriver(widget.id).then((response){
      if(!response.errors){
        _DriversState.notifier3.sink.add(widget.position);
      }
      setState(() {
        updateDriverApiCall =false ;
      });
      Navigator.pop(context);
    },onError: (error){
      setState(() {
        updateDriverApiCall =false ;
      });
      print("delete driver error : : $error");
    });

  }
  @override
  void initState() {
    super.initState();
    name =TextEditingController(text: widget.name);
    phone =TextEditingController(text :widget.phone) ;
    note =TextEditingController(text: widget.note);
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(8)
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 16),
          height: MediaQuery.of(context).size.height/1.5,
          child:updateDriverApiCall?Center(child: CircularProgressIndicator(),): Column(
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child:
                  Column(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Center(
                          child: Text("معلومات السائق",
                            style: TextStyle(
                              color: GoodColors.brown,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: GoodColors.greyLight,
                            height: 3,
                            width: MediaQuery.of(context).size.width/2.9,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 2,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Image.asset("images/add_driver_photo.png"),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 7,
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: name.text!=""&&phone.text!=""?GoodColors.brownDark:GoodColors.greyLight,
                          ),
                        ),
                        child: TextField(
                          controller: name,
                          style: TextStyle(
                            height: .5,
                          ),
                          decoration: InputDecoration(
                            icon: Icon(Icons.person,color:name.text!=""&&phone.text!=""?GoodColors.brownDark: Colors.grey,),
                            hintText: "اسم السائق",
                            hintStyle: TextStyle(
                              color: GoodColors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: name.text!=""&&phone.text!=""?GoodColors.brownDark:GoodColors.greyLight,
                          ),
                        ),
                        child: TextField(
                          controller: phone,
                          style: TextStyle(
                            height: .5,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            icon: Icon(Icons.phone,color: name.text!=""&&phone.text!=""?GoodColors.brownDark:Colors.grey,),
                            hintText: "رقم السائق",
                            hintStyle: TextStyle(
                              color: GoodColors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: name.text!=""&&phone.text!=""?GoodColors.brownDark:GoodColors.greyLight,
                          ),
                        ),
                        child: TextField(
                          controller: note,
                          minLines: 4,
                          maxLines: 4,
                          style: TextStyle(
                            height: 1,
                          ),
                          decoration: InputDecoration(
                            icon: Icon(Icons.speaker_notes,color: name.text!=""&&phone.text!=""?GoodColors.brownDark:Colors.grey,),
                            hintText: "إضافة ملحوظة",
                            hintStyle: TextStyle(
                              color: GoodColors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: InkWell(
                                  onTap:(){
                                    updateDriver(context);
                                  } ,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: name.text!=""&&phone.text!=""?GoodColors.brownLight:GoodColors.greyLight,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.edit,color: Colors.white,size: 20,),
                                        Text("  تعديل",
                                          style: TextStyle(
                                            color: name.text!=""&&phone.text!=""?Colors.white:GoodColors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(right:8.0),
                                child: InkWell(
                                  onTap: (){
                                    deleteDriver(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: name.text!=""&&phone.text!=""?GoodColors.brownDark:GoodColors.greyLight,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.delete,color: Colors.white,size: 20,),
                                        Text("  حذف",
                                          style: TextStyle(
                                            color: name.text!=""&&phone.text!=""?Colors.white:GoodColors.grey,
                                          ),
                                        ),
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
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right :8.0,left: 8,top: 2,bottom: 2),
                    child: InkWell(
                      onTap: (){
                              Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: name.text!=""&&phone.text!=""?GoodColors.brownDark:GoodColors.greyLight,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(
                          child: Text("حفظ",
                            style: TextStyle(
                              color: name.text!=""&&phone.text!=""?Colors.white:GoodColors.grey,
                            ),
                          ),
                        ),
                      ),
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