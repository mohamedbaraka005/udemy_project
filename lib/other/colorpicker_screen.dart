import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
main()
{
  runApp(colorPicker1());
}
class colorPicker1 extends StatefulWidget {
  @override
  _colorPicker1State createState() => _colorPicker1State();
}

class _colorPicker1State extends State<colorPicker1> {
  Color currentColor = Colors.red ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children:[
              Text("Text Color" , style: TextStyle(backgroundColor:currentColor,color:useWhiteForeground(currentColor)?Color(0xffffffff):Color(0xff000000)),),
              SingleChildScrollView(
              child: SlidePicker(
                pickerColor:currentColor ,
                  //enableLabel: true,
                  onColorChanged :(color){
                  setState(() {
                    currentColor = color;
                  });
                  }

              ),
            ),]
          ),
        ),
      ),
    );
  }
}
