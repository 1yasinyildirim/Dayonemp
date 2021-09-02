import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:line_icons/line_icons.dart';
import 'package:dayonemp/pages/ilanver.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:dayonemp/login/register.dart';

class Basvurular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Basvuru());
  }
}

class Basvuru extends StatefulWidget {
  Basvuru({Key? key}) : super(key: key);

  @override
  _BasvuruState createState() => _BasvuruState();
}

class _BasvuruState extends State<Basvuru> {
  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  var currentUser = FirebaseAuth.instance.currentUser;

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('basvurular').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: refresh,
        backgroundColor: Colors.pink.shade900,
        color: Colors.amber,
        child: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Internet bağlantınız yok');//eğer internet bağlantısı yoksa
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.pink.shade900,
                  strokeWidth: 2,
                ));
              }
              return ListView(
                children: snapshot.data!.docs.map(
                  (DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return ListTile(
                      contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      title: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 2,
                                color: Colors.pink.shade900,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                          ),
                          margin: EdgeInsets.all(0),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: <
                                  Widget>[
                            ListTile(
                              leading: Icon(Icons.cases_outlined,
                                  color: Colors.amber),
                              title: Text(data['ilaninadi']),
                              subtitle: Row(
                                children: [
                                  Text(
                                    data['fiyat'],
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                  Icon(
                                    LineIcons.turkishLiraSign,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            ),
                            ButtonTheme(
                                child: ButtonBar(children: <Widget>[
                              Container(
                                width: 70,
                                height: 35,
                                child: FlatButton(
                                  color: Colors.pink.shade900,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 3,
                                        color: Colors.amber,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                  child: Text(
                                    "Incele",
                                    style: GoogleFonts.fugazOne(
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    Alert(
                                        onWillPopActive: true,
                                        closeIcon: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 3, color: Colors.red),
                                            ),
                                            padding: EdgeInsets.all(2),
                                            child: Icon(Icons.close_outlined,
                                                size: 25, color: Colors.red)),
                                        style: AlertStyle(
                                          alertPadding: EdgeInsets.all(20),
                                          overlayColor: Colors.white,
                                          animationType: AnimationType.shrink,
                                          animationDuration:
                                              Duration(milliseconds: 600),
                                          alertBorder: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(25),
                                                topRight: Radius.circular(25)),
                                            side: BorderSide(
                                              color: Colors.amber,
                                              width: 3,
                                            ),
                                          ),
                                        ),
                                        context: context,
                                        content: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.75,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "İlanı Veren",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.grey,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                      Text(
                                                        data['ilaniveren'],
                                                        style: TextStyle(
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.075,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.075,
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "İlanın Adı",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.grey,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                      Text(
                                                        data['ilaninadi'],
                                                        style: TextStyle(
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.075,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.075,
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Unvan",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.grey,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                      Text(
                                                        data['unvan'],
                                                        style: TextStyle(
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.075,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.075,
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Konum",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.grey,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                      Text(
                                                        data['konum'],
                                                        style: TextStyle(
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.075,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.075,
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Fiyatı",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.grey,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                      Text(
                                                        data['fiyat'],
                                                        style: TextStyle(
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.075,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.075,
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Açıklama",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.grey,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                      Text(
                                                        data['aciklama'],
                                                        style: TextStyle(
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.075,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.075,
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                                    //mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Container(
                                                            child: Ink(
                                                              decoration:
                                                                  ShapeDecoration(
                                                                color: Colors
                                                                    .amber,
                                                                shape:
                                                                    CircleBorder(),
                                                              ),
                                                              child: IconButton(
                                                                  icon: Icon(Icons
                                                                      .message_outlined),
                                                                  color: Colors
                                                                      .pink
                                                                      .shade900,
                                                                  onPressed:
                                                                      () {}),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Ink(
                                                              decoration:
                                                                  ShapeDecoration(
                                                                color: Colors
                                                                    .amber,
                                                                shape:
                                                                    CircleBorder(),
                                                              ),
                                                              child: IconButton(
                                                                  icon: Icon(Icons
                                                                      .call_outlined),
                                                                  color: Colors
                                                                      .pink
                                                                      .shade900,
                                                                  onPressed:
                                                                      () {}),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.025,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.025,
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                "Basvurunuz Bekleniyor...",
                                                style: GoogleFonts.fugazOne(
                                                  color: Colors.amber,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        buttons: [
                                          DialogButton(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            border: Border.all(
                                                width: 3, color: Colors.amber),
                                            color: Colors.pink.shade900,
                                            radius: BorderRadius.only(
                                                bottomLeft: Radius.circular(15),
                                                topRight: Radius.circular(15)),
                                            onPressed: () {
                                            },
                                            child: Text(
                                              "Kapat",
                                              style: GoogleFonts.fugazOne(
                                                color: Colors.amber,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ]).show();
                                  },
                                ),
                              ),
                            ]))
                          ])),
                    );
                  },
                ).toList(),
              );
            }),
      ),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty)
    return 'E-mail address is required.';

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty)
    return 'Password is required.';

  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword))
    return '''
      Password must be at least 8 characters,
      include an uppercase letter, number and symbol.
      ''';

  return null;
}
