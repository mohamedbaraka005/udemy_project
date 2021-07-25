import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

main() => runApp(perIndicator());

class perIndicator extends StatefulWidget {
  @override
  _perIndicatorState createState() => _perIndicatorState();
}

class _perIndicatorState extends State<perIndicator> {
  static const List<String> namelist = [
    "jan",
    "feb",
    "mar",
    "apr",
    "may",
    "jun",
    "jul",
    "ogs",
    "nov",
    "dec",
    "this",
    "end",
  ];
  List<Color> colorList =
      List.generate(namelist.length, (index) => Colors.primaries[index]);

  @override
  Widget build(BuildContext context) {
    int i = 0 ;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("percent Indicator"),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: InteractiveViewer(
             // panEnabled: false,
             // constrained: false,
             // scaleEnabled: true,
             minScale: 0.1,
             maxScale: 2,
            child:Image.asset("assets/images/FB_IMG_15390268291817510.jpg" , fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }
}
