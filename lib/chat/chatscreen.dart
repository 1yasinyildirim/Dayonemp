import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dayonemp/login/register.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  TextEditingController msg = TextEditingController();

  final storeMessage = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Yasin Yıldırım"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(height: 200, child: SingleChildScrollView(child: ShowMessage())),
          Row(
            children: [
              Expanded(
                child: Container(
                  width:  MediaQuery.of(context).size.height * 0.9,
                  decoration: BoxDecoration(
                    
                      border: Border(
                          top: BorderSide(color: Colors.black, width: 1))),
                  child: TextField(
                    controller: msg,
                    decoration: InputDecoration(hintText: "Mesaj..."),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    if (msg.text.isNotEmpty) {
                      storeMessage.collection("messages")
                      .doc(msg.text.trim()) //random eklense düzelir
                      .set({
                        "message": msg.text.trim(),
                        "user": user!.uid,
                        "time": DateTime.now()
                      });
                      msg.clear();
                    }
                  },
                  icon: Icon(Icons.send)),
            ],
          ),
        ],
      ),
    );
  }
}

void onPressed() {}

final Stream<QuerySnapshot> _usersStream =
    FirebaseFirestore.instance
    .collection('messages')
    .orderBy("time",descending: true)
    .snapshots();

class ShowMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.pink.shade900,
              strokeWidth: 2,
            ));
          }
          return ListView(
            reverse: true,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            primary: true,
            children: snapshot.data!.docs.map(
              (DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Container(
                  //color:Colors.red,
                  child: ListTile(
                    //subtitle: Text(DateTime.utc(year)),
                    title: Column(
                      crossAxisAlignment: user!.uid == data['user']
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical:7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                            border:Border.all(
      color:user!.uid == data['user']?Colors.amber:Colors.pink.shade900,
      width: 2.0,
    ),
                                  color:user!.uid == data['user']?Colors.pink.shade900:Colors.amber,

                          ),
                          child: Text(
                              data['message'],
                              style: GoogleFonts.patrickHand(
                                fontSize: 18,
                                color:Colors.white60
                              )
                              ),
                        ),
                      ],
                    ),
                    //subtitle: Text("${DateTime.now()}"),
                  ),
                );
              },
            ).toList(),
          );
        });
  }
}