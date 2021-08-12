import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'login/login.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dayonemp",
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: Login(),
        duration: 3,
          animationDuration: Duration(milliseconds: 1800),
          centered:true,
          pageTransitionType: PageTransitionType.bottomToTop,
        backgroundColor: Colors.pink.shade900,
        splash: SizedBox(
          width:double.maxFinite,
          height:double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                    color: Colors.amber,
                    width: 2,
      ),
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
  ),
                  alignment: Alignment.center,
                  width:250, height:70,
                  child: Text(
                    "Dayonemp",
                    style: GoogleFonts.fugazOne(
                      color: Colors.amber,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
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
