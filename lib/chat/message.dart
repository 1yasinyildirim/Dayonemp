import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {

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
                                margin: EdgeInsets.all(0),

                shape: RoundedRectangleBorder(
                  side: BorderSide( width:2,
                      color: Colors.pink.shade900, style: BorderStyle.solid),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),topRight: Radius.circular(25)),
                ),
                child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                    leading:IconButton(
                        icon: Icon(Icons.message_outlined,color:Colors.amber), onPressed: onPressed),
                    title: Text(
                      'Ad Soyad',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      'attığı mesaj',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ])),
              ),                
            ],
          ),
      ),
                    /**/
          );
  }
}

void onPressed() {}