import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'file:///C:/Users/LENOVO/AndroidStudioProjects/flutter_app_work/lib/other/inherited_widget.dart';
import 'file:///C:/Users/LENOVO/AndroidStudioProjects/flutter_app_work/lib/other/splash_screen.dart';
import 'PView_screen.dart';

import 'agecalcfun.dart';


class agecalc extends StatefulWidget {
  static const routeName = "agecalcRoutename";

  @override
  State<StatefulWidget> createState() {
    return agecalcstate();
  }
}

class agecalcstate extends State<agecalc> {
  int val = 6;
  int val2 = 5;
  int val3 = 5;
  bool vall = false;
  int _radiovalue;

  List imageUrl = [
    "assets/images/FB_IMG_15390268291817510.jpg",
    "assets/images/FB_IMG_15390268879682866.jpg",
    "assets/images/FB_IMG_15390687320750355.jpg",
  ];
  var color1 = Colors.white70;
  var color2 = Colors.greenAccent;
  var color3 = Colors.deepOrange;
  int yourage = 0;
  String str = "Your age is ";

  var year = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        //"/" : (context) => MainSplashScreen(),
        agecalc.routeName: (context) => agecalc(),
        PViewScreen.routName: (context) => PViewScreen(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text("AGE Calculator"),
          //backgroundColor: color3,
          centerTitle: true,
          leading: Icon(Icons.accessibility_new_sharp),
        ),
        body: ListView(children: [
          SizedBox(
            height: 20,
          ),
          RadioListTile(
            value: val,
            groupValue: _radiovalue,
            controlAffinity: ListTileControlAffinity.trailing,
            onChanged: (value) {
              setState(() {
                _radiovalue = value;
              });
            },
            title: Text("Sign out"),
            subtitle: Text("click to log out."),

          ),
          CheckboxListTile(
            value: vall,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() {
                vall = value;
              });
            },
            title: Text("Alarm"),
            subtitle: Text("click to add alarm..."),

          ),
          RadioListTile(
            value: val2,
            groupValue: _radiovalue,
            onChanged: (value) {
              setState(() {
                _radiovalue = value;
              });
            },
            title: Text("Sign in"),
            subtitle: Text("click to log in."),

          ),
          SizedBox(height: 20,),
          DropdownButton(
            hint: Text("choose from the choices"),
            disabledHint: Text("DisapledHint"),
            value: _radiovalue,
            items: [
              DropdownMenuItem(
                child: Text("hello"),
                value: 0,
              ),
              DropdownMenuItem(
                child: Text("welcome"),
                value: 3,
              ),
              DropdownMenuItem(
                child: Text("free"),
                value: 2,
              ),
            ],
            onChanged: (newVal) {
              setState(() {
                _radiovalue = newVal;
              });
            },),

                ExpansionTile(
                  leading: Icon(Icons.attach_money),
                  title: Text("Accounts"),
                  children: [
                    MyColor(color: Colors.red, child: Builder(builder: (ctx)=>
                       RaisedButton(
                         child: Text("Navigate to Page View."),
                          onPressed: () {
                            Navigator.of(ctx).pushNamed(PViewScreen.routName);
                          },
                          color: MyColor
                              .of(ctx)
                              .color),
                    ),),
                    Text("sign in"),
                    Text("sign out"),
                    Text("Exit"),
                  ],

                ),


        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              color1 =
              (color1 == Colors.black12) ? Colors.white70 : Colors.black12;
              color2 = (color2 == Colors.cyanAccent)
                  ? Colors.greenAccent
                  : Colors.cyanAccent;
              color3 = (color3 == Colors.deepOrange)
                  ? Colors.blue
                  : Colors.deepOrange;
            });
          },
          backgroundColor: Colors.red,
          child: Icon(Icons.album),
        ),
      ),
    );
  }
}
