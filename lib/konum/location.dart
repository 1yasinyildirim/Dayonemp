import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:dayonemp/konum/filter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
//import 'location/location.dart';
import 'package:google_fonts/google_fonts.dart';

class Konum extends StatefulWidget {
  Konum({Key? key}) : super(key: key);

  @override
  _KonumState createState() => _KonumState();
}

SfRangeValues _values = SfRangeValues(40.0, 80.0);

class _KonumState extends State<Konum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container()
    );
  }
}

void displayBottomSheet(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      context: context,
      builder: (ctx) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              Container(
                  child: Center(
                      child: Container(
                color: Colors.grey,
                width: 50,
                height: 3,
                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              ))),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 2,
                          color: Colors.pink.shade900,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                    ),
                    //color: Colors.grey.shade100,
                    //shadowColor: Colors.black,
                    margin: EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: IconButton(
                              icon: Icon(LineIcons.mapMarker,
                                  color: Colors.amber),
                              onPressed: onPressed),
                          title: Text(
                            'İş İlanı',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            '300m mesafede',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

void onPressed() {}
