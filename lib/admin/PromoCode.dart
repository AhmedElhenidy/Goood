import 'package:camel/admin/statics/admin_app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';


class PromoCode extends StatefulWidget {
  PromoCode({Key key}) : super(key: key);

  @override
  _PromoCodeState createState() {
    return _PromoCodeState();
  }
}

class _PromoCodeState extends State<PromoCode> {


  @override
  void dispose() {
    super.dispose();
  }

  GlobalKey<ScaffoldState> _scaffoldKeyProfile ;
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile =GlobalKey<ScaffoldState>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBarClass().appBar(context, _scaffoldKeyProfile,"اكواد الخصم"),
      body: Container(
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
                    Text("العدد : 55 كود"),
                    InkWell(
                      onTap: (){
                        showDialog(context: context,
                            builder: (context)=>PromoInfo( id :0 , name :"" ,phone:"" ,note:"")
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
                  itemCount: 9,
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
                                                    child: Text("خصم 50%",style: TextStyle(fontSize: 18),)),
                                                Container(
                                                  height: MediaQuery.of(context).size.width/11,
                                                  width: MediaQuery.of(context).size.width/5,
                                                  decoration: BoxDecoration(
                                                      color: GoodColors.brownDark,
                                                      borderRadius: BorderRadius.circular(8)
                                                  ),
                                                  child: Center(child: Text("50%",style: TextStyle(fontSize: 14 , color: Colors.white),),),
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
                                                Text("البدايه :20/5/2019",style: TextStyle(fontSize: 12),),

                                                Text("النهايه :20/6/2019",style: TextStyle(fontSize: 12),),
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
  int id ;
  String name ,phone ,note;
  PromoInfo({this.id,this.name,this.phone,this.note});

  _PromoInfoState createState()=> _PromoInfoState();
}
class _PromoInfoState extends State<PromoInfo> {
  TextEditingController name ,phone ,note ;
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
          height: MediaQuery.of(context).size.height/2,
          child: Column(
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
                          controller: name,
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
                          controller: phone,
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
                      Container(
                        padding: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color:GoodColors.brownDark,
                          ),
                        ),
                        child: TextField(
                          controller: phone,
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

                      Container(
                        padding: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color:GoodColors.brownDark,
                          ),
                        ),
                        child: TextField(
                          controller: phone,
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