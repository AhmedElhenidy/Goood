import 'dart:math';

import 'package:camel/Api/ClientApi.dart';
import 'package:camel/model/User.dart';
import 'package:camel/statics/bottom_navigation.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:camel/style/bubble_indication_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:camel/style/theme.dart' as Theme;


class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();
}


class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {

//  _showForgotPassworfDialog( ) async {
//   String response =  await showDialog<String>(
//      context: context,
//      builder: (BuildContext context) {
//        return new Dialog(
//          shape:
//          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//          child: new SingleChildScrollView(
//            child: new Material(
//              child: new ForgotPassword(),
//            ),
//          ),
//        );
//      },
//    );
//
//   print("dialog response : $response");
//   if(response == "1")showInSnackBar(A"" "تم ارسال الرقم السري الى هاتفك" : "The password code has been sent to your phone"
//   ,color: Colors.green
//   ) ;
//  }



  TextEditingController loginNumberController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _obscureTextLogin = true;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupPhoneNumberController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
      new TextEditingController();

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height >= 775.0
                  ? MediaQuery.of(context).size.height
                  : 775.0,
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      Theme.Colors.loginGradientStart,
                      Theme.Colors.loginGradientEnd
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[

                  Container(

                    width :MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex : 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top : 30.0),
                            child: Container(
                              padding: EdgeInsets.all(16),
                              height: 150,
                              child:Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BottomNavigationBarClass(1)));
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25)
                                    ),
                                    child: Center(
                                      child: Text("<   تخطي" ,style:TextStyle(
                                        color: GoodColors.brown,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                      ),),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Padding(
                              padding:  EdgeInsets.only(top: 50.0),
                              child: Hero(
                                tag: "logo",
                                child: Container(
                                  height: 130,
                                    child: Image.asset("images/logo.png",fit:BoxFit.fill,)
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex : 1,
                          child: Container(
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: _buildMenuBar(context),
                  ),
                  Expanded(
                    flex: 2,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (i) {
                        setupState(i);
                      },
                      children: <Widget>[
                        new ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: _buildSignIn(context),
                        ),
                        new ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: _buildSignUp(context),
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
    );
  }

  @override
  void dispose() {

    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void showInSnackBar(String value , {Color color}) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor:color ==null ?  Colors.red : color,
      duration: Duration(seconds: 3),
    ));
  }

  Widget _buildMenuBar(BuildContext context) {
    
      return containerForRTL();

  }

  Widget _buildSignIn(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  height: 160.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 25, right: 25.0),
                        child: TextField(
                          focusNode: new FocusNode(),
                          controller: loginNumberController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.phone,
                              color: Colors.black,
                              size: 22.0,
                            ),
                            hintText: "رقم الجوال",
                            hintStyle: TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 25, right: 25.0),
                        child: TextField(
                          focusNode: new FocusNode(),
                          controller: loginPasswordController,
                          obscureText: _obscureTextLogin,
                          style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.lock,
                              size: 22.0,
                              color: Colors.black,
                            ),
                            hintText:  "كلمة المرور",
                            hintStyle: TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                            suffixIcon: GestureDetector(
                              onTap: _toggleLogin,
                              child: Icon(
                                FontAwesomeIcons.eye,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:145.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.Colors.loginGradientStart,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                    BoxShadow(
                      color: Theme.Colors.loginGradientEnd,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  gradient: new LinearGradient(
                      colors: [
                        Theme.Colors.loginGradientStart,
                        Theme.Colors.loginGradientStart
                      ],
                      begin: const FractionalOffset(0.2, 0.2),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Theme.Colors.loginGradientStart,
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: apiCall ? CircularProgressIndicator() :  Text(
                       "تسجيل الدخول",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: "WorkSansBold"),
                      ),
                    ),
                    onPressed: () {
                      if(!apiCall) login() ;
                    },
                        ),
              ),
            ],
          ),

//            Padding(
//              padding: EdgeInsets.only(top: 10.0),
//              child: FlatButton(
//                  onPressed: () {},
//                  child: Text(
//                   "نسيت كلمة السر",
//                    style: TextStyle(
//                        decoration: TextDecoration.underline,
//                        color: Colors.white,
//                        fontSize: 16.0,
//                        fontFamily: "WorkSansMedium"),
//                  ),
//              ),
//            ),



//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: showErrorMessage(),
//          ),
        ],
      ),
    );
  }
  bool isLoginFormValid ( String number , String password ) {

    bool valid = true ;

    if(number.isEmpty){ valid = false ; }
    if(password.isEmpty){ valid = false ;}
    setState(() {
     if(!valid) apiCall = false ;
      errors = !valid ;
      errorMessage = "" "من فضلك تاكد من ملأ جميع الحقول"  ;
  });

      if(!valid) this.showInSnackBar(errorMessage);
    return valid ;
  }

  Widget _buildSignUp(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  height: 370.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 25, right: 25.0),
                        child: TextField(
                          focusNode:new FocusNode(),
                          controller: signupNameController,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.black,
                            ),
                            hintText:"الاسم",
                            hintStyle: TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 25, right: 25.0),
                        child: TextField(
                          focusNode: new FocusNode(),
                          controller: signupEmailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.idCard,
                              color: Colors.black,
                            ),
                            hintText: "البريد الايكتروني",
                            hintStyle: TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 25, right: 25.0),
                        child: TextField(
                          focusNode: new FocusNode(),
                          controller: signupPhoneNumberController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.phone,
                              color: Colors.black,
                            ),
                            hintText:  "رقم الهاتف",
                            hintStyle: TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 25, right: 25.0),
                        child: TextField(
                          focusNode: new FocusNode(),
                          controller: signupPasswordController,
                          obscureText: _obscureTextSignup,
                          style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.lock,
                              color: Colors.black,
                            ),
                            hintText:  "كلمة المرور",
                            hintStyle: TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                            suffixIcon: GestureDetector(
                              onTap: _toggleSignup,
                              child: Icon(
                                FontAwesomeIcons.eye,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 25, right: 25.0),
                        child: TextField(
                          focusNode: new FocusNode(),
                          controller: signupConfirmPasswordController,
                          obscureText: _obscureTextSignupConfirm,
                          style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.lock,
                              color: Colors.black,
                            ),
                            hintText:  "تاكيد كلمة المرور" ,
                            hintStyle: TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                            suffixIcon: GestureDetector(
                              onTap: _toggleSignupConfirm,
                              child: Icon(
                                FontAwesomeIcons.eye,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 360.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.Colors.loginGradientStart,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                    BoxShadow(
                      color: Theme.Colors.loginGradientEnd,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  gradient: new LinearGradient(
                      colors: [
                        Theme.Colors.loginGradientStart,
                        Theme.Colors.loginGradientStart
                      ],
                      begin: const FractionalOffset(0.2, 0.2),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child:  MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Theme.Colors.loginGradientStart,
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child:apiCall ? CircularProgressIndicator() :  Text(
                       "تسجيل حساب جديد",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: "WorkSansBold"),
                      ),
                    ),
                    onPressed: (){
                      if(!apiCall) register() ;
                    },

              ),

//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: showErrorMessage(),
//              ),
              )
            ],
          ),
        ],
      ),
    );
  }

    bool apiCall = false ;
  bool errors = false ;
  String errorMessage ;

    bool isSignUpFormValid (String name , String nationalId , String password , String mobile , String confirmPassword) {

      bool valid = true ;

      if(name.isEmpty){ valid = false ; }
      if(nationalId.isEmpty) {valid = false ; }
      if(mobile.isEmpty) {valid = false ; }
      if(password.isEmpty){ valid = false ;}
      if(confirmPassword.isEmpty){ valid = false ; }
      if(password != confirmPassword){ valid = false ;}
      setState(() {
        if(!valid) apiCall = false ;
        errors = !valid ;
        errorMessage =  "من فضلك تاكد من ملأ جميع الحقول"  ;
      });

      if(!valid) this.showInSnackBar(errorMessage);
      return valid ;
    }
    
    login(){
      if(!isLoginFormValid(loginNumberController.text, loginPasswordController.text)){
        return 0 ; 
      }
     setState(() {
       this.apiCall = true ; 
     });
      
      ClientApi.login(loginNumberController.text, loginPasswordController.text).then((resposne){
        setState(() {
          this.apiCall = false ;
        });
        if(resposne.errors){
          showInSnackBar(resposne.message_ar);
        }else{
          User user = resposne.user ;
          user.password = loginPasswordController.text ;

          saveUser(user).then((done){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BottomNavigationBarClass(1)));
          });
        }
      },onError: (error){
        print("login error : : $error");
        setState(() {
          this.apiCall = false ;
        });
      });
    }
    register(){
      if(!isSignUpFormValid(signupNameController.text, signupEmailController.text ,signupPasswordController.text, signupPhoneNumberController.text , signupConfirmPasswordController.text)){
        return 0 ;
      }
     setState(() {
       this.apiCall = true ;
     });

      ClientApi.register(signupNameController.text, signupEmailController.text ,signupPhoneNumberController.text ,signupPasswordController.text , signupConfirmPasswordController.text).then((resposne){
        setState(() {
          this.apiCall = false ;
        });
        if(resposne.errors){
          showInSnackBar(resposne.message_ar);
        }else{
          User user = resposne.user ;
          user.password = signupPasswordController.text ;
          saveUser(user).then((done){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BottomNavigationBarClass(1)));
          });
        }
      },onError: (error){
        print("login error : : $error");
        setState(() {
          this.apiCall = false ;
        });
      });
    }


    Widget showErrorMessage(){
      return  errors ? new Text(errorMessage , style: TextStyle(fontSize: 15 , color: Colors.red , fontWeight: FontWeight.bold),) : new Container() ;
    }



  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }

  void setupState(int i) {
    if (i == 0) {
      setState(() {
        right = Colors.white;
        left = Colors.black;
      });
    } else if (i == 1) {
      setState(() {
        right = Colors.black;
        left = Colors.white;
      });
    }
  }

  Container containerForRTL() {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "حساب جديد",
                  style: TextStyle(
                      color: right,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignInButtonPress,
                child: Text(
                  "حساب حالي",
                  style: TextStyle(
                      color: left,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
