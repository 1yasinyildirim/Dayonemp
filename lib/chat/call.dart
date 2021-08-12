import 'package:flutter/material.dart';

class Call extends StatefulWidget {
  Call({Key? key}) : super(key: key);

  @override
  _CallState createState() => _CallState();
}

class _CallState extends State<Call> {

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
            padding: EdgeInsets.all(0),
            children: [
              ListTile(
                  contentPadding: EdgeInsets.fromLTRB(0,5,0,0),
                          title:Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide( width:2,
                      color: Colors.pink.shade900, style: BorderStyle.solid),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),topRight: Radius.circular(25)),
                ),
                //color: Colors.grey.shade100,
                //shadowColor: Colors.black,
                margin: EdgeInsets.all(8),
                child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                    leading:IconButton(
                        icon: Icon(Icons.call_outlined,color:Colors.amber), onPressed: onPressed),
                    title: Text(
                      'Ad Soyad',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      'Arama',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ])),
              ),                
            ],
          ),
      ),);
  }
}

void onPressed() {}

/**/