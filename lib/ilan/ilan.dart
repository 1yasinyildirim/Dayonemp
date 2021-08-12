import 'package:flutter/material.dart';
import 'package:dayonemp/ilan/basvurular.dart';
import 'package:dayonemp/ilan/ilanlar.dart';

class Ilan extends StatefulWidget {
  Ilan({Key? key}) : super(key: key);

  @override
  _IlanState createState() => _IlanState();
}

class _IlanState extends State<Ilan> {
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
                "İlanlar",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.pink.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Tab(
              child: Text(
                "Başvurular",
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
            Ilanlar(),
            Basvurular(),
          ],
        ),
      ),
    );
  }
}
