import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dayonemp/login/login.dart';
class Anasayfa extends StatefulWidget {
  Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //brightness: Brightness.dark,
          ),
      home: Scaffold(
        body: RefreshIndicator(
          onRefresh: refresh,
          backgroundColor: Colors.pink.shade900,
          color: Colors.amber,
          child: ListView(
            padding: EdgeInsets.all(0),
            children: [
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading:
                                Icon(Icons.chat_outlined, color: Colors.amber),
                            title: Text('Yasin Yıldırım'),
                            subtitle:
                                Text('adlı kullanıcı ilanınıza başvuru yaptı'),
                          ),
                          ButtonTheme(
                              child: ButtonBar(children: <Widget>[
                            Container(
                              width: 90,
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
                                  "Kabul Et",
                                  style: GoogleFonts.fugazOne(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: (){/**/},
                              ),
                            ),
                            Container(
                              width: 90,
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
                                  "Reddet",
                                  style: GoogleFonts.fugazOne(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {/**/},
                              ),
                            ),
                          ]))
                        ])),
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading:
                                Icon(Icons.chat_outlined, color: Colors.amber),
                            title: Text('Yasin Yıldırım'),
                            subtitle:
                                Text('adlı kullanıcı ilanınıza başvuru yaptı'),
                          ),
                          ButtonTheme(
                              child: ButtonBar(children: <Widget>[
                            Container(
                              width: 90,
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
                                  "Kabul Et",
                                  style: GoogleFonts.fugazOne(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {/** */},
                              ),
                            ),
                            Container(
                              width: 90,
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
                                  "Reddet",
                                  style: GoogleFonts.fugazOne(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {/**/},
                              ),
                            ),
                          ]))
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void onPressed() {}
