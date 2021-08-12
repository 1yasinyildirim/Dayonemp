import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class LocFilter extends StatefulWidget {
  LocFilter({Key? key}) : super(key: key);

  @override
  _LocFilterState createState() => _LocFilterState();
}

class _LocFilterState extends State<LocFilter> {

  SfRangeValues _values = SfRangeValues(40.0, 80.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height:50),
            Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 2,
                      color: Colors.pink.shade900,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                
                margin: EdgeInsets.all(8),
                child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                    title: Text('Mesafe(km)'),
                    subtitle:  Expanded(  
                        child: SfRangeSlider(
          activeColor: Colors.amber,
          inactiveColor: Colors.amber.shade100,
          min: 0.0,
          max: 100.0,
          values: _values,
          interval: 20,
          showTicks: true,
          showLabels: true,
          minorTicksPerInterval: 1,
          onChanged: (SfRangeValues values){
            setState(() {
              _values = values;
            });
          },
        ),  
                    ),    
                    ),
                  
                ])),
          ],
        ),
      )
    );
  }
}

void onPressed() {}
