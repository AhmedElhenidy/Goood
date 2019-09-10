import 'package:camel/Api/ClientApi.dart';
import 'package:camel/DataBase/SqliteDataBase.dart';
import 'package:camel/model/OrderModel.dart';
import 'package:camel/statics/app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

import 'Succsses_order.dart';
class ConfirmOrder extends StatefulWidget{
  Order order ;

  ConfirmOrder(this.order);

  _ConfirmOrderState createState()=> _ConfirmOrderState();
}
class _ConfirmOrderState extends State<ConfirmOrder>{
  GlobalKey<ScaffoldState> _scaffoldKeyProfile ;
  TextEditingController name = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController note = new TextEditingController();
  bool confirmOrderApi = false ;

  saveOrderShipping(){
    setState(() {
      this.confirmOrderApi = true ;
    });
    ClientApi.addShippingInfo(widget.order.id, name.text, address.text, phone.text, "$selectDate $selectedTime", note.text).then((errors){
      if(!errors){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SuccessOrder()));
      }
    });
  }
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile =new GlobalKey<ScaffoldState>();
  }
  int count = 0 ;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies() ;
    SqlLiteDataBase.getShoppingCartCount().then((count){
      setState(() {
        this.count = count ;
      });
    });
  }
  String selectedTime ="حدد الوقت";
  getTime() async {
    DatePicker.showDatePicker(
        context,
        dateFormat: "H:m",
        pickerMode: DateTimePickerMode.time,
        onConfirm: ( dateTime , ints){
          setState(() {
            selectedTime = "${dateTime.hour}:${dateTime.minute}" ;
          });
        }
    );
  }
String selectDate = "حدد اليوم" ;
 static const String MIN_DATETIME = '2010-05-12';
 static const String MAX_DATETIME = '2021-11-25';
 static const String INIT_DATETIME = '2019-05-17';
  DateTimePickerLocale _locale = DateTimePickerLocale.en_us;
  getDate() async {
    DatePicker.showDatePicker(
        context,
        dateFormat: 'yyyy-MM-dd',
        minDateTime: DateTime.parse(MIN_DATETIME),
        maxDateTime: DateTime.parse(MAX_DATETIME),
        initialDateTime: DateTime.parse(INIT_DATETIME),
        locale: _locale,
        pickerMode: DateTimePickerMode.date,
        onConfirm: ( dateTime , ints){
          setState(() {
            selectDate = "${dateTime.year}/${dateTime.month}/${dateTime.day}" ;
          });
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarClass().appBar(context, _scaffoldKeyProfile,false ,count),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: Container(
                    //color: Colors.red,
                    height:260,// MediaQuery.of(context).size.height/2.5,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding:EdgeInsets.only(top: 4,bottom: 4),
                            width: MediaQuery.of(context).size.width/1.5,
                            height: MediaQuery.of(context).size.width/11,
                            decoration: BoxDecoration(
                              color: GoodColors.brownLight,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Text("بيانات الطلب",
                                style: TextStyle(color: GoodColors.brownDark ,fontSize: 16,
                                  fontFamily: 'black75',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(child: Container(
                                child: Center(child: Text("عدد المنتجات :",style: TextStyle(fontSize: 16 , color: GoodColors.brownDark,fontFamily: 'black75',),),),
                              ) ,flex: 1,),
                              Expanded(child: Container(
                                child:Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("${widget.order.product.length} منتجات",style: TextStyle(fontSize: 16 , color: GoodColors.brownDark,fontFamily: 'black75',),),),
                              ) ,flex: 2,),
                            ],
                          ),
                        ),flex: 1,),
                        Flexible(child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(child: Container(
                                child: Center(child: Text(" سعر الطلب :",style: TextStyle(fontSize: 16 , color: GoodColors.brownDark,fontFamily: 'black75',),),),
                              ) ,flex: 1,),
                              Expanded(child: Container(
                                child:Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("${widget.order.price} ر.س",style: TextStyle(fontSize: 16 , color: GoodColors.brownDark,fontFamily: 'black75',),),),
                              ) ,flex: 2,),
                            ],
                          ),
                        ),flex: 1,),
                        Flexible(child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(child: Container(
                                child: Center(child: Text("سعر التوصيل :",style: TextStyle(fontSize: 16 , color: GoodColors.brownDark,fontFamily: 'black75',),),),
                              ) ,flex: 1,),
                              Expanded(child: Container(
                                child:Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("20 ر.س",style: TextStyle(fontSize: 16 , color: GoodColors.brownDark,fontFamily: 'black75',),),),
                              ) ,flex: 2,),
                            ],
                          ),
                        ),flex: 1,),
                        Flexible(child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(child: Container(
                                child: Center(child: Text("الاجمالي :",style: TextStyle(fontSize: 16 , color: GoodColors.brownDark,fontFamily: 'black75',),),),
                              ) ,flex: 1,),
                              Expanded(child: Container(
                                child:Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("${int.parse(widget.order.price)+20} ر.س",style: TextStyle(fontSize: 16 , color: GoodColors.brownDark,fontFamily: 'black75',),),),
                              ) ,flex: 2,),
                            ],
                          ),
                        ),flex: 1,),
                          Padding(
                            padding: const EdgeInsets.only(left:16.0 ,right: 16),
                            child: Divider(height: 3, color: GoodColors.brownLight,),
                          ),
                        Flexible(child: Container(
                          padding: EdgeInsets.only(right: 16 ,left: 16),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: MediaQuery.of(context).size.width/11,
                                  width: MediaQuery.of(context).size.width/3,
                                decoration: BoxDecoration(
                                  color: GoodColors.brownDark,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: Center(child: Text("كود الخصم",style: TextStyle(fontSize: 16 , color: Colors.white,fontFamily: 'black75',),),),
                              ) ,flex: 1,),
                              Expanded(child: Container(
                                padding: EdgeInsets.only(right: 16),

                                child:Align(
                                  alignment: Alignment.centerRight,
                                  child:  Container(
                                    width: MediaQuery.of(context).size.width/3.5,
                                    height: MediaQuery.of(context).size.width/11,
                                    child: TextField(
                                      style: TextStyle(
                                          color: GoodColors.brownDark,
                                          fontSize: 14
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(20),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: GoodColors.brownDark),
                                          borderRadius: BorderRadius.circular(7),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(7),
                                          borderSide: BorderSide(
                                            color: GoodColors.brownDark,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ) ,flex: 2,),
                              Expanded(
                                child: Container(
                                  height: MediaQuery.of(context).size.width/11,
                                  width: MediaQuery.of(context).size.width/3,
                                  decoration: BoxDecoration(
                                      color: GoodColors.brownDark,
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Center(child: Text("تاكيد",style: TextStyle(fontSize: 16 , color: Colors.white,fontFamily: 'black75',),),),
                                ) ,flex: 1,),

                            ],
                          ),
                        ),flex: 2,),

                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: Container(
                    //color: Colors.red,
                    height:260,// MediaQuery.of(context).size.height/2.5,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding:EdgeInsets.only(top: 4,bottom: 4),
                          width: MediaQuery.of(context).size.width/1.5,
                          decoration: BoxDecoration(
                            color: GoodColors.brownLight,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Text("بيانات شخصية",
                              style: TextStyle(color: GoodColors.brownDark,fontFamily: 'black75',),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top :8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width/1.9,
                            child: Center(
                              child: TextField(
                                controller: name,
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: "الاسم",
                                  hintStyle: TextStyle(color: GoodColors.greyLight),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide(color: GoodColors.brown),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top :8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width/1.9,
                            child: Center(
                              child: TextField(
                                controller: phone,
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: "رقم الهاتف",
                                  hintStyle: TextStyle(color: GoodColors.greyLight),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide(color: GoodColors.brown),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top :8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width/1.9,
                            child: Center(
                              child: TextField(
                                controller: address,
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: "العنوان",
                                  hintStyle: TextStyle(color: GoodColors.greyLight),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide(color: GoodColors.brown),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:16.0),
                          child: Container(
                            padding:EdgeInsets.only(top: 4,bottom: 4),
                            width: MediaQuery.of(context).size.width/1.9,
                            decoration: BoxDecoration(
                              color: GoodColors.brownDark,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text("حدد العنوان على الخريطة",
                                style: TextStyle(color: Colors.white,fontFamily: 'black75',),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:16.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      //color: Colors.blue,
                      //height: 180,//MediaQuery.of(context).size.height/3,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding:EdgeInsets.only(top: 4,bottom: 4),
                            width: MediaQuery.of(context).size.width/1.5,
                            decoration: BoxDecoration(
                              color: GoodColors.brownLight,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Text("وقت التوصيل",
                                style: TextStyle(color: GoodColors.brownDark,fontFamily: 'black75',),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Container(
                             // padding: EdgeInsets.only(top: 4,bottom: 4),
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: GoodColors.brown,
                                ),
                              ),
                              child: InkWell(
                                onTap: (){
                                  getDate();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.arrow_drop_down,color:GoodColors.brownDark ,size: 35,),
                                    Text(selectDate,style: TextStyle(color: GoodColors.brownDark),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Container(
                             // padding: EdgeInsets.only(top: 4,bottom: 4),
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: GoodColors.brown,
                                ),
                              ),
                              child: InkWell(
                                onTap: (){
                                  getTime();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.arrow_drop_down,color:GoodColors.brownDark,size: 35,),
                                    Text(selectedTime,style: TextStyle(color: GoodColors.brownDark),),
                                  ],
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
              Padding(
                padding: const EdgeInsets.only(top:16.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      //height: MediaQuery.of(context).size.height/3,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding:EdgeInsets.only(top: 4,bottom: 4),
                            width: MediaQuery.of(context).size.width/1.5,
                            decoration: BoxDecoration(
                              color: GoodColors.brownLight,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Text("كتابة ملحوظة",
                                style: TextStyle(color: GoodColors.brownDark,fontFamily: 'black75',),
                              ),

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top :16.0),
                            child: Container(
                              constraints: BoxConstraints(
                                minHeight: 100,
                              ),
                              width: MediaQuery.of(context).size.width/1.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: GoodColors.grey,
                                ),
                              ),
                              child: TextField(
                                controller: note,
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                                scrollPhysics: BouncingScrollPhysics(),
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide.none
                                  ),
                                  hintText: "اكتب ملحوظاتك هنا",
                                  hintStyle: TextStyle(color: GoodColors.brownLight),
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top:16,bottom: 16),
                child: InkWell(
                  onTap: (){
                    saveOrderShipping();
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    decoration: BoxDecoration(
                      color: GoodColors.brownDark,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Center(
                      child:this.confirmOrderApi ? CircularProgressIndicator(): Text("تم",style: TextStyle(color: Colors.white,fontFamily: 'black75',),),
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