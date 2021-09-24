import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:dayonemp/login/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Ilanver extends StatefulWidget {
  @override
  _IlanverState createState() => _IlanverState();
}

final ilaniniz = TextEditingController();
final unvan = TextEditingController();
final konum = TextEditingController();
final fiyat = TextEditingController();
final aciklama = TextEditingController();

class _IlanverState extends State<Ilanver> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
  bool isLoading = false;

  final snackBar = SnackBar(
    backgroundColor: Colors.pink.shade900,
    duration: Duration(milliseconds: 3000),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(15),
    shape: RoundedRectangleBorder(
        side: BorderSide(width: 3, color: Colors.amber),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), topRight: Radius.circular(15))),
    content: Text('İlan Başarıyla Eklendi',
        style: TextStyle(fontWeight: FontWeight.bold)),
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
        primarySwatch: Colors.amber, /*brightness: Brightness.dark*/
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 650,
                margin: EdgeInsets.all(20),
                child: Card(
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
                            margin: EdgeInsets.fromLTRB(10, 25, 10, 10),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top: 0, bottom: 0),
                              child: TextFormField(
                                controller: ilaniniz,
                                keyboardType: TextInputType.name,
                                cursorColor: Colors.amber,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(LineIcons.user),
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
                                  labelText: 'İlanınız',
                                  hintText: 'İlanınızın Adı...',
                                  hintStyle: TextStyle(
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
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
                                hintText: 'Unvanınızı Giriniz...',
                                hintStyle: TextStyle(
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 0, bottom: 0),
                            //padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: konum,
                                  keyboardType: TextInputType.emailAddress,
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
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 0, bottom: 0),
                            //padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: fiyat,
                                  cursorColor: Colors.amber,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(LineIcons.turkishLiraSign),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(25),
                                          bottomLeft: Radius.circular(25)),
                                    ),
                                    //labelStyle: TextStyle(color: Colors.amber),
                                    labelText: 'Fiyat',
                                    hintText: 'Fiyatı Giriniz...',
                                    hintStyle: TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                              ],
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
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Center(
                            child: Text(errorMessage,
                                style: TextStyle(color: Colors.red)),
                          ),
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
                                side:
                                    BorderSide(width: 2.5, color: Colors.amber),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    topRight: Radius.circular(25)),
                              ),
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
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                  errorMessage = '';
                                });
                                if (_key.currentState!.validate()) {
                                  try {
                                    // await FirebaseFirestore.instance
                                    //   .collection('users')
                                    // .doc(user!.uid)
                                    //.get();

                                    await FirebaseFirestore.instance
                                        .collection("ilanlar")
                                        .doc(ilaniniz.text)
                                        .set({
                                      "userilan": user!.uid,
                                      "name": nameController.text,
                                      "surname": surnameController.text,
                                      "aciklama": aciklama.text,
                                      "ilan": ilaniniz.text,
                                      "fiyat": fiyat.text,
                                      "konum": konum.text,
                                      "unvan": unvan.text
                                    });
                                    nameController.clear();
                                    surnameController.clear();
                                    aciklama.clear();
                                    ilaniniz.clear();
                                    fiyat.clear();
                                    konum.clear();
                                    unvan.clear();
                                  } on FirebaseAuthException catch (error) {
                                    errorMessage = error.message!;
                                  } finally {
                                    Timer(Duration(seconds: 3), () {
                                      setState(() {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                        setState(() => isLoading = false);
                                      });
                                    });
                                    //setState(() => isLoading = false);
                                  }
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressed() {}
}
