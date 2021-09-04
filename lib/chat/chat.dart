import 'package:dayonemp/chat/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:dayonemp/chat/call.dart';
import 'package:dayonemp/chat/message.dart';

class Chatver extends StatefulWidget {
  Chatver({Key? key}) : super(key: key);

  @override
  _ChatverState createState() => _ChatverState();
}

class _ChatverState extends State<Chatver> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          indicatorColor: Colors.amber,
          tabs: [
            Tab(
              child: Text(
                "Mesajlar",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.pink.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Tab(
              child: Text(
                "Aramalar",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.pink.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            //MessageScreen(),
            Message(),
            Call(),
          ],
        ),
      ),
    );
  }
}
