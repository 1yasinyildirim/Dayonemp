import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:dayonemp/home.dart';
import 'package:dayonemp/login/register.dart';
import 'package:line_icons/line_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ilanver extends StatefulWidget {
  @override
  _IlanverState createState() => _IlanverState();
}

class _IlanverState extends State<Ilanver> {

  final adsoyad = TextEditingController();
  final unvan = TextEditingController();
  final konum = TextEditingController();
  final tarih = TextEditingController();
  final fiyat = TextEditingController();
  final aciklama = TextEditingController();

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
                            child: TextField(
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
                          child: TextField(
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
                          child: TextField(
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
                          child: TextField(
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
                          child: TextField(
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
                            child: TextField(
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
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection("ilanlar")
                                .add(
                                  {
                                    "aciklama" : aciklama.text,
                                    "ad_soyad" : adsoyad.text,
                                    "tarih" : tarih.text,
                                    "fiyat" : fiyat.text,
                                    "konum" : konum.text,
                                    "unvan" : unvan.text
                                  }
                                );
                          },
                          child: Text(
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
