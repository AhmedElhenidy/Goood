import 'package:camel/statics/app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
class ConfirmOrder extends StatefulWidget{
  _ConfirmOrderState createState()=> _ConfirmOrderState();
}
class _ConfirmOrderState extends State<ConfirmOrder>{
  GlobalKey<ScaffoldState> _scaffoldKeyProfile ;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile =new GlobalKey<ScaffoldState>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarClass().appBar(context, _scaffoldKeyProfile,false),
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
                        Container(
                          padding:EdgeInsets.only(top: 4,bottom: 4),
                          width: MediaQuery.of(context).size.width/1.5,
                          decoration: BoxDecoration(
                            color: GoodColors.brownLight,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Text("بيانات شخصية",
                              style: TextStyle(color: GoodColors.brownDark),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top :8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width/1.9,
                            child: Center(
                              child: TextField(
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
                                style: TextStyle(color: Colors.white),
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
                                style: TextStyle(color: GoodColors.brownDark),
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.arrow_drop_down,color:GoodColors.brownDark ,size: 35,),
                                    Text("حدد اليوم",style: TextStyle(color: GoodColors.brownDark),),
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.arrow_drop_down,color:GoodColors.brownDark,size: 35,),
                                    Text("حدد الوقت",style: TextStyle(color: GoodColors.brownDark),),
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
                                style: TextStyle(color: GoodColors.brownDark),
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
                child: Container(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: GoodColors.brownDark,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(
                    child: Text("تم",style: TextStyle(color: Colors.white),),
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