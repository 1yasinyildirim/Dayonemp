import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Basvurular extends StatefulWidget {
  Basvurular({Key? key}) : super(key: key);

  @override
  _BasvurularState createState() => _BasvurularState();
}

class _BasvurularState extends State<Basvurular> {

  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
              onRefresh: refresh,
              backgroundColor: Colors.pink.shade900,
              color: Colors.amber,
          child: ListView(
            children: [
              ListTile(
                  contentPadding: EdgeInsets.fromLTRB(5,0,5,0),
                          title:Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 2,
                color: Colors.pink.shade900,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
          //color: Colors.grey.shade100,
          //shadowColor: Colors.black,
          margin: EdgeInsets.all(0),
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            ListTile(
              leading: Icon(Icons.cases_outlined, color: Colors.amber),
              title: Text('Ad Soyad'),
              subtitle: Text('ilanınına başvurunuz bekleniyor'),
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
                  onPressed: () {/** */},
                ),
              ),
            ]))
          ])),
              ),                
            ],
          ),
      ),
    );
  }
}
