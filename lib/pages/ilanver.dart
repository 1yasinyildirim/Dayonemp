import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:dayonemp/home.dart';
import 'package:dayonemp/login/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Ilanver extends StatefulWidget {
  @override
  _IlanverState createState() => _IlanverState();
}

class _IlanverState extends State<Ilanver> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
  bool isLoading = false;

  final adsoyad = TextEditingController();
  final unvan = TextEditingController();
  final konum = TextEditingController();
  final tarih = TextEditingController();
  final fiyat = TextEditingController();
  final aciklama = TextEditingController();

  final snackBar = SnackBar(
    backgroundColor: Colors.pink.shade900,
    duration: Duration(milliseconds: 3000),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(15),
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 3, color: Colors.amber),
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), topRight: Radius.circular(15))),
    content: Text('İlan Başarıyla Eklendi'),
    action: SnackBarAction(
    label: 'Tamam',
    onPressed: () {},
    ),
    );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //brightness: Brightness.dark,
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        //backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 700,
                margin: EdgeInsets.all(20),
                child: Card(
                  //color: Colors.grey.shade50,
                  //shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 3, color: Colors.pink.shade900),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        Padding(
                          //padding:  EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(5, 25, 5, 10),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top: 0, bottom: 0),
                              child: TextFormField(
                                controller: adsoyad,
                                keyboardType: TextInputType.name,
                                textAlignVertical: TextAlignVertical.top,
                                textAlign: TextAlign.left,
                                cursorColor: Colors.amber,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(LineIcons.alternateUser),
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
                                  labelText: 'Adınız ve Soyadınız',
                                  hintText: 'Adınızı ve Soyadınızı girin...',
                                  hintStyle: TextStyle(
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 0, bottom: 0),
                            //padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              controller: unvan,
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.amber,
                              decoration: InputDecoration(
                                suffixIcon: Icon(LineIcons.userTie),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25)),
                                ),
                                //labelStyle: TextStyle(color: Colors.amber),
                                labelText: 'Unvanınız',
                                hintText: 'Unvanınızı Girin',
                                hintStyle: TextStyle(
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 0, bottom: 0),
                            //padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              controller: konum,
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.amber,
                              decoration: InputDecoration(
                                suffixIcon: Icon(LineIcons.mapMarker),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25)),
                                ),
                                //labelStyle: TextStyle(color: Colors.amber),
                                labelText: 'Konum',
                                hintText: 'Konumunuzu Girin',
                                hintStyle: TextStyle(
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 0, bottom: 0),
                            //padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              controller: tarih,
                              keyboardType: TextInputType.datetime,
                              cursorColor: Colors.amber,
                              decoration: InputDecoration(
                                suffixIcon: Icon(LineIcons.alternateCalendar),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25)),
                                ),
                                //labelStyle: TextStyle(color: Colors.amber),
                                labelText: 'Tarih',
                                hintText: 'Tarihi Girin',
                                hintStyle: TextStyle(
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 0, bottom: 0),
                            //padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              controller: fiyat,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.amber,
                              decoration: InputDecoration(
                                suffixIcon: Icon(LineIcons.turkishLiraSign),
                                //pfixIcon: Icon(LineIcons.turkishLiraSign),sola olan
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25)),
                                ),
                                //labelStyle: TextStyle(color: Colors.amber),
                                labelText: 'Fiyat',
                                hintText: 'Fiyat Kriterinizi Girin',
                                hintStyle: TextStyle(
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 0, bottom: 0),
                            //padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              //margin:EdgeInsets.all(30),
                              child: TextFormField(
                                controller: aciklama,
                                keyboardType: TextInputType.text,
                                maxLines: 6,
                                textAlignVertical: TextAlignVertical.top,
                                textAlign: TextAlign.left,
                                cursorColor: Colors.amber,
                                maxLength: 500,
                                decoration: InputDecoration(
                                  //contentPadding: EdgeInsets.symmetric(vertical: 90.0,horizontal:10),
                                  suffixIcon: Icon(LineIcons.userEdit),
                                  //pfixIcon: Icon(LineIcons.turkishLiraSign),sola olan
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(25),
                                        bottomLeft: Radius.circular(25)),
                                  ),
                                  //labelStyle: TextStyle(color: Colors.amber),
                                  labelText: 'Açıklama',
                                  hintText: 'Açıklamanızı Yazın',
                                  hintStyle: TextStyle(
                                    color: Colors.amber,
                                  ),
                                ),
                                autofocus: true,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
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
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                                errorMessage = '';
                              });
                              FirebaseFirestore.instance
                                  .collection("ilanlar")
                                  .add({
                                "aciklama": aciklama.text,
                                "ad_soyad": adsoyad.text,
                                "tarih": tarih.text,
                                "fiyat": fiyat.text,
                                "konum": konum.text,
                                "unvan": unvan.text
                              });
                              Timer.periodic( Duration(seconds: 5), (t) {
      setState(() {
        isLoading = false;
      });
      t.cancel(); 
      ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
    });
                              

                            },
                            child: isLoading
                                ? CircularProgressIndicator(
                                    color: Colors.amber,
                                    strokeWidth: 2,
                                  )
                                : Text(
                                    'Ilan Ver',
                                    style: GoogleFonts.fugazOne(
                                      color: Colors.amber,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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

  void onPressed() {}
}
