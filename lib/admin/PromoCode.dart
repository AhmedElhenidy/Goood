import 'dart:async';
import 'package:intl/intl.dart';
import 'package:camel/admin/statics/admin_app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'api/promoCode_api.dart';
import 'model/promo_code.dart';

class PromoCode extends StatefulWidget {
  PromoCode({Key key}) : super(key: key);
  @override
  _PromoCodeState createState() {
    return _PromoCodeState();
  }
}
class _PromoCodeState extends State<PromoCode> {
  static StreamController notifier = new StreamController.broadcast();
  final Stream trigger = notifier.stream ;
  StreamSubscription subscription ;
   List<PromoCodeModel> promoList = new List();
  bool getAllPromoApiCall = false ;
  getAllPromo(){
    setState(() {
      getAllPromoApiCall = true ;
    });
    PromoCodeApi.getAllPromoCodes().then((response){
      setState(() {
        this.promoList =response.promoList;
        getAllPromoApiCall = false ;
      });
    },onError: (error){
      setState(() {
        getAllPromoApiCall = false ;
      });
      print("get All promo error : : : $error");
    });
  }
  deletePromo(int id,int position){
    setState(() {
      getAllPromoApiCall=true;
    });
    PromoCodeApi.deletePromo(id).then((response){
      getAllPromo();
    });
  }
  @override
  void dispose() {
    super.dispose();
  }
  GlobalKey<ScaffoldState> _scaffoldKeyProfile ;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile =GlobalKey<ScaffoldState>();
    this.getAllPromo();
    subscription =  trigger.listen((i){
      setState(() {
        promoList.add(i);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBarClass().appBar(context, _scaffoldKeyProfile,"اكواد الخصم"),
      body: getAllPromoApiCall
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
                    Text("العدد : ${promoList.length} كود"),
                    InkWell(
                      onTap: (){
                        showDialog(context: context,
                            builder: (context)=>PromoInfo()
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 16,left: 16),
                        decoration: BoxDecoration(
                          color: GoodColors.brownLight,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Center(
                          child: Text("+ إضافة كود",
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
                  itemCount: promoList.length,
                  itemBuilder: (context,position){
                    return Padding(
                      padding: const EdgeInsets.only(bottom:16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
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
                                  flex: 4,
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Flexible(
                                          flex: 1,
                                          fit: FlexFit.tight,
                                          child: Container(
                                            padding: EdgeInsets.only(right: 2,top: 14),
                                            child:Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: Text("${promoList[position].codeName}",style: TextStyle(fontSize: 18),)),
                                                Container(
                                                  height: MediaQuery.of(context).size.width/11,
                                                  width: MediaQuery.of(context).size.width/5,
                                                  decoration: BoxDecoration(
                                                      color: GoodColors.brownDark,
                                                      borderRadius: BorderRadius.circular(8)
                                                  ),
                                                  child: Center(child: Text("${promoList[position].amount}%",style: TextStyle(fontSize: 14 , color: Colors.white),),),
                                                )
                                              ],
                                            ),
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
                                                Text("البدايه :${promoList[position].startDate}",style: TextStyle(fontSize: 12),),

                                                Text("النهايه :${promoList[position].endDate}",style: TextStyle(fontSize: 12),),
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
                                  child: InkWell(
                                    onTap: (){
                                      deletePromo(promoList[position].id,position);
                                    },
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: GoodColors.brownDark,
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

class PromoInfo extends StatefulWidget{
  _PromoInfoState createState()=> _PromoInfoState();
}
class _PromoInfoState extends State<PromoInfo> {
  TextEditingController codeName ,amount ,startDate,endDate ;
  bool addPromoApiCall =false;
  final String MIN_DATETIME = '2015-01-01';
  final String MAX_DATETIME = '2070-12-31';
  final String INIT_DATETIME= '2019-09-20';
  bool _showTitle = true;
  DateTimePickerLocale _locale = DateTimePickerLocale.en_us;
  String _format = 'yyyy-MMMM-dd';
  void _startDateShowDatePicker() {
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        //title: Text("تاريخ البداية",style: TextStyle(color: GoodColors.brown,),),
        showTitle: _showTitle,
        confirm: Text('تم', style: TextStyle(color: GoodColors.brownDark,fontSize: 16,fontFamily: 'bold65',)),
        cancel: Text('إلغاء', style: TextStyle(color: GoodColors.grey,fontSize: 16,fontFamily: 'bold65',)),
      ),
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: DateTime.now(),
      dateFormat: _format,
      locale: _locale,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onChange: (dateTime, List<int> index) {
        setState(() {
          startDate.text = DateFormat('yyyy-MM-dd').format(dateTime);
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          startDate.text = DateFormat('yyyy-MM-dd').format(dateTime);
        });
      },
    );
  }
  void _endDateShowDatePicker() {
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        //title: Text("تاريخ البداية",style: TextStyle(color: GoodColors.brown,),),
        showTitle: _showTitle,
        confirm: Text('تم',
            style: TextStyle(color: GoodColors.brownDark,
              fontFamily: 'bold65',
              fontSize: 16,
            ),),
        cancel: Text('إلغاء',
            style: TextStyle(color: GoodColors.grey,fontFamily: 'bold65',fontSize: 16)),
      ),
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: DateTime.now(),
      dateFormat: _format,
      locale: _locale,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onChange: (dateTime, List<int> index) {
        setState(() {
          endDate.text = DateFormat('yyyy-MM-dd').format(dateTime);
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          endDate.text = DateFormat('yyyy-MM-dd').format(dateTime);
        });
      },
    );
  }
  addPromo(BuildContext context){
    setState(() {
      addPromoApiCall =true;
    });
    PromoCodeApi.addNewPromoCode( codeName.text,startDate.text,endDate.text,amount.text).then((response){
      if(!response.errors){
        _PromoCodeState.notifier.sink.add(response.promo);
      }
      setState(() {
        addPromoApiCall =false;
      });
      Navigator.pop(context);
    },onError: (error){
      setState(() {
        addPromoApiCall =false;
      });
      print("Add promo error :: $error");
    });
  }
  @override
  void initState() {
    super.initState();
    codeName =TextEditingController();
    amount =TextEditingController() ;
    startDate =TextEditingController();
    endDate =TextEditingController();
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
          height: MediaQuery.of(context).size.height/2,
          child: addPromoApiCall?Center(child: CircularProgressIndicator(),):Column(
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
                          child: Text("اضافة كود",
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
                            color: GoodColors.brownDark,
                          ),
                        ),
                        child: TextField(
                          controller: codeName,
                          style: TextStyle(
                            height: .5,
                          ),
                          decoration: InputDecoration(
                            icon: Icon(Icons.add_circle,color:GoodColors.brownDark),
                            hintText: "الكود",
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
                            color:GoodColors.brownDark,
                          ),
                        ),
                        child: TextField(
                          controller: amount,
                          style: TextStyle(
                            height: .5,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            icon: Icon(Icons.local_offer,color: GoodColors.brownDark,),
                            hintText: "نسبة الخصم",
                            hintStyle: TextStyle(
                              color: GoodColors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: _startDateShowDatePicker,
                        child: Container(
                          padding: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color:GoodColors.brownDark,
                            ),
                          ),
                          child: TextField(
                            enabled: false,
                            controller: startDate,
                            style: TextStyle(
                              height: .5,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              icon: Icon(Icons.access_alarm,color: GoodColors.brownDark,),
                              hintText: "تاريخ البداية",
                              hintStyle: TextStyle(
                                color: GoodColors.grey,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: _endDateShowDatePicker,
                        child: Container(
                          padding: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color:GoodColors.brownDark,
                            ),
                          ),
                          child: TextField(
                            enabled: false,
                            controller: endDate,
                            style: TextStyle(
                              height: .5,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              icon: Icon(Icons.access_alarm,color: GoodColors.brownDark,),
                              hintText: "تاريخ النهاية",
                              hintStyle: TextStyle(
                                color: GoodColors.grey,
                              ),
                              border: InputBorder.none,
                            ),
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
                      onTap: (){
                        addPromo(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: GoodColors.brownDark,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(
                          child: Text("حفظ",
                            style: TextStyle(
                              color: Colors.white,
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