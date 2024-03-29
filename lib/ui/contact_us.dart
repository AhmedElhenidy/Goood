import 'package:camel/Api/ClientApi.dart';
import 'package:camel/DataBase/SqliteDataBase.dart';
import 'package:camel/statics/drawer.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:camel/statics/snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:camel/statics/app_bar.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
class ContactUs extends StatefulWidget{
  _ContactUsState createState()=> _ContactUsState();
}
class _ContactUsState extends State<ContactUs>{
  GlobalKey<ScaffoldState> _scaffoldKeyProfile ;
  int count = 0 ;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile =new GlobalKey<ScaffoldState>();
  }
  bool contactUsApi = false ;
   contactUs(){
    if(name.text.isEmpty || phone.text.isEmpty || message.text.isEmpty){
      showInSnackBar("من فضلك تاكد من اضافة جميع البيانات", context, _scaffoldKey);
      return 0 ;
    }
    setState(() {
      this.contactUsApi = true ;
    });
    ClientApi.contactUs(name.text, phone.text, message.text).then((response){
      setState(() {
        this.contactUsApi =false ;
      });
      if(!response.errors )
        showInSnackBar("ارسلت الرسالة بنجاح", context, _scaffoldKey);
      else
        showInSnackBar(response.message, context, _scaffoldKey);
    },onError: (error){
      setState(() {
        this.contactUsApi =false ;
      });
      print("contact Us error : : : $error");

    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies() ;
    SqlLiteDataBase.getShoppingCartCount().then((count){
      setState(() {
        this.count = count ;
      });
    });
  }
TextEditingController message = new TextEditingController();
TextEditingController name = new TextEditingController();
TextEditingController phone = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerClass().showDrawer(context),
      appBar: AppBarClass().appBar(context, _scaffoldKeyProfile,false,count),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width/1.15,
                height: MediaQuery.of(context).size.height/2.1,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 5,
                      right: 5,
                      bottom: 5,
                      child: Card(
                        elevation: 10,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(
                              color: GoodColors.brownLight,
                              width: 3,
                            style: BorderStyle.solid
                          ),
                        ),
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: 250
                          ),
                          width: MediaQuery.of(context).size.width/1.5,
                          height: MediaQuery.of(context).size.height/2.8,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Flexible(
                                  child: Container(

                                  ),
                                  flex: 1,
                                ),
                                Flexible(
                                  child: Container(
                                    child: InkWell(
                                     onTap: ()=>launch('https://www.instagram.com/aljoodmeat/'),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Image.asset("images/instagram.png",height: 25,width: 25,),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              child: Align(
                                                alignment: Alignment.centerRight,
                                                child: Text("   تابعنا على إنستجرام",
                                                  textDirection: TextDirection.rtl,
                                                  style: TextStyle(
                                                      color: GoodColors.brown,
                                                    fontFamily: 'bold65',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                  flex: 1,
                                ),
                                Flexible(
                                  child: Container(
                                    child: InkWell(
                                      onTap: ()=>launch('https://twitter.com/aljoodmeat'),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Image.asset("images/twitter.png",height: 25,width: 25,),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              child: Align(
                                                alignment: Alignment.centerRight,
                                                child: Text("   تابعنا على تويتر",
                                                  textDirection: TextDirection.rtl,
                                                  style: TextStyle(
                                                      color: GoodColors.brown,
                                                    fontFamily: 'bold65',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),),flex: 1,),
                                Flexible(
                                  child: Container(
                                  child: InkWell(
                                    onTap: ()=>launch('https://www.snapchat.com/add/almm99'),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Image.asset("images/youtube.png",height: 25,width: 25,),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("   تابعنا على يوتيوب",
                                                textDirection: TextDirection.rtl,
                                                style: TextStyle(
                                                    color: GoodColors.brown,
                                                  fontFamily: 'bold65',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),),flex: 1,),
                                Flexible(child: Container(
                                  child: InkWell(
                                    onTap: ()=>launch('https://www.snapchat.com/add/almmm99'),
                                    child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Image.asset("images/snapshat.png",height: 25,width: 25,),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text("   تابعنا على اسناب شات",
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  color: GoodColors.brown,
                                                fontFamily: 'bold65',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                ),
                                  ),),flex: 1,),
                                Flexible(child: Container(
                                  child:InkWell(
                                    onTap:()=>launch('https://iwtsp.com/966537537823'),
                                    child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Image.asset("images/telephone.png",height: 25,width: 25,),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text("   +966502661634",
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  color: GoodColors.brown,
                                                fontFamily: 'bold65',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                ),
                                  ),),flex: 1,),
                                Flexible(child: Container(),flex: 1,),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(top :25.0),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                height: 40,
                                width: 216,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: GoodColors.brownLight
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text("حساباتنا",
                                    style: TextStyle(fontSize: 17,fontFamily: 'black75',),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //share
                    Positioned(
                      top: 1,
                      right: MediaQuery.of(context).size.width/2.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("images/sharr.png",
                            width: 40,height: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/50,),
              Container(
                width: MediaQuery.of(context).size.width/1.15,
                height: MediaQuery.of(context).size.height/1.65,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 40,
                      left: 5,
                      right: 5,
                      bottom: 0,
                      child: Container(
                        child: Card(
                          elevation: 10,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(
                                color: GoodColors.brownLight,
                                width: 3,
                                style: BorderStyle.solid
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom:0.0),
                            child: Container(
                              constraints: BoxConstraints(
                                  minHeight: 265
                              ),
                              height: MediaQuery.of(context).size.height/2.8,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(height: MediaQuery.of(context).size.height/20,),
                                    Container(
                                      width: MediaQuery.of(context).size.width/1.9,
                                      child: Center(
                                        child: TextField(
                                          controller: name,
                                          textDirection: TextDirection.rtl,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(8),
                                            hintText: "الاسم",
                                            hintStyle: TextStyle(

                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xff707070),),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xff707070),),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height/50,),
                                    Container(
                                      width: MediaQuery.of(context).size.width/1.9,
                                      child: Center(
                                        child: TextField(
                                          controller: phone,
                                          textDirection: TextDirection.rtl,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(8),
                                            hintText: "رقم الهاتف",
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xff707070),),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xff707070),),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height/50,),
                                    Container(
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
                                        controller: message,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 3,
                                        scrollPhysics: BouncingScrollPhysics(),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(8),
                                          border: UnderlineInputBorder(
                                              borderSide: BorderSide.none
                                          ),
                                          hintText: "الرسالة",
                                        ),
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height/50,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(top :25.0),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                height: 40,
                                width: 216,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: GoodColors.brownLight
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text("راسلنا بكل سهولة",
                                    style: TextStyle(fontSize: 17,fontFamily: 'black75',),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 1,
                      right: MediaQuery.of(context).size.width/3,
                      left: MediaQuery.of(context).size.width/3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("images/message.png",
                            width: 40,height: 40,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top:MediaQuery.of(context).size.height/2 -5 ,
                      left: (MediaQuery.of(context).size.width/1.9)/2.5,
                      right: (MediaQuery.of(context).size.width/1.9)/2.5,
                      bottom: MediaQuery.of(context).size.height/25,
                      child: InkWell(
                        onTap: (){
                          contactUs();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: GoodColors.brown,
                            borderRadius: BorderRadius.circular(7)
                          ),
                          width: 100,
                          height: 40,
                          child: Center(
                            child: this.contactUsApi ? CircularProgressIndicator(): Text("ارسال",style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: 'black75',),),
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
    );
  }

}