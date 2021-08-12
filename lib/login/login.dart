import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:dayonemp/home.dart';
import 'package:dayonemp/login/register.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

_dialogalert(context) {
  Alert(
      onWillPopActive: true,
      closeIcon: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 3, color: Colors.red),
          ),
          padding: EdgeInsets.all(2),
          child: Icon(Icons.close_outlined, size: 25, color: Colors.red)),
      style: AlertStyle(
        alertPadding: EdgeInsets.all(20),
        overlayColor: Colors.white,
        animationType: AnimationType.shrink,
        animationDuration: Duration(milliseconds: 600),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
          side: BorderSide(
            color: Colors.amber,
            width: 3,
          ),
        ),
      ),
      context: context,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Icon(Icons.error_outline_outlined, size: 60, color: Colors.red),
              Text(
                "Şifrenizi yenilemek için\nmailinizi giriniz...",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 25, 5, 10),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.amber,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.mail_outlined),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                    width: 30,
                  ),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25)),
                ),
                //labelStyle: TextStyle(color: Colors.amber),
                labelText: 'Email',
                hintText: 'E-malinizi girin',
                hintStyle: TextStyle(
                  color: Colors.amber,
                ),
              ),
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          width: MediaQuery.of(context).size.height * 0.15,
          border: Border.all(width: 3, color: Colors.amber),
          color: Colors.pink.shade900,
          radius: BorderRadius.only(
              bottomLeft: Radius.circular(15), topRight: Radius.circular(15)),
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Gonder",
            style: GoogleFonts.fugazOne(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ]).show();
}

bool _isObscure = true;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dayonemp",
      theme: ThemeData(
        dialogTheme: DialogTheme(),
        //brightness: Brightness.dark,
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.pink.shade900,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  alignment: Alignment.center,
                  width: 250,
                  height: 70,
                  child: Text(
                    "Dayonemp",
                    style: GoogleFonts.fugazOne(
                      color: Colors.pink.shade900,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
              ),
              Container(
                height: 325,
                margin: EdgeInsets.all(15),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 3, color: Colors.pink.shade900),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        //padding:  EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(25, 25, 25, 10),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 0),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.amber,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.mail_outlined),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.amber,
                                    width: 30,
                                  ),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25)),
                                ),
                                //labelStyle: TextStyle(color: Colors.amber),
                                labelText: 'Email',
                                hintText: 'E-malinizi girin',
                                hintStyle: TextStyle(
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 0, right: 0, top: 0, bottom: 0),
                          //padding: EdgeInsets.symmetric(horizontal: 15),
                          child: TextField(
                            cursorColor: Colors.amber,
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: Icon(_isObscure
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  }),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25)),
                              ),
                              //labelStyle: TextStyle(color: Colors.amber),
                              labelText: 'Şifre',
                              hintText: 'Şifrenizi Girin',
                              hintStyle: TextStyle(
                                color: Colors.amber,
                              ),
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () => _dialogalert(context),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 25, 0, 35),
                          child: Text(
                            'Şifremi Unuttum',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.amber,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.pink.shade900,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                          ),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2.5, color: Colors.amber),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                            ),
                            onPressed: () => showSnackBar(context),
                            child: Text(
                              'Giris Yap',
                              style: GoogleFonts.fugazOne(
                                color: Colors.amber,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FlatButton(
                onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    duration: Duration(milliseconds: 500),
                    child: Register(),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Text(
                    'Hesabınız yoksa kaydolun',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.pink.shade900,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: <Color>[
                              Colors.grey.shade50,
                              Colors.grey,
                            ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, 1.0),
                            stops: <double>[0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      width: 100.0,
                      height: 1.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5),
                      child: Text(
                        'veya',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontFamily: 'WorkSansMedium'),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: <Color>[
                              Colors.grey,
                              Colors.grey.shade50,
                            ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, 1.0),
                            stops: <double>[0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      width: 100.0,
                      height: 1.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.amber,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(LineIcons.googlePlusG),
                        color: Colors.pink.shade900,
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HostHome()),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.amber,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                          icon: Icon(LineIcons.facebook),
                          color: Colors.pink.shade900,
                          onPressed: onPressed),
                    ),
                  ),
                ],
              ),
              Container(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void onPressed() {}
showSnackBar(BuildContext context) {
  final snackBar = SnackBar(
      content: Text('E-mail veya şifre yanlış',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w500)),
      margin: EdgeInsets.all(30),
      backgroundColor: Colors.pink.shade900,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.amber, width: 3),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25), topRight: Radius.circular(25))),
      duration: Duration(milliseconds: 2000),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'Click',
        onPressed: () {
          print('Action is clicked');
        },
        textColor: Colors.amber,
        disabledTextColor: Colors.grey,
      ));
  Scaffold.of(context).showSnackBar(snackBar);
}
