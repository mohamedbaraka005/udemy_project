import 'package:flutter/material.dart';
import 'file:///C:/Users/LENOVO/AndroidStudioProjects/flutter_app_work/lib/other/inherited_widget.dart';

import '1_screen.dart';
import '2_screen.dart';
import '3_screen.dart';
import 'agecalculator.dart';

// main() {
//   runApp(PViewScreen());
// }

class PViewScreen extends StatefulWidget {
  static const routName = "/pvname";
  @override
  _PViewScreenState createState() => _PViewScreenState();
}

class _PViewScreenState extends State<PViewScreen> {

  int _index = 0;
  int _page =0;

  PageController _control ;
  @override
  void initState() {
    setState(() {
      _control = PageController(
        initialPage: _index  ,
      );
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(children: [
          PageView(
            onPageChanged: ( _page ) {
              setState(() {
                _index = _page;
              });
            },
            controller: _control,
            children: [
              Screen1(),
              Screen2(),
              Screen3(),
            ],
          ),
          Align(
            alignment: Alignment(0, 1),
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: double.infinity,
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                    FlatButton(
                      color:Colors.blue,
                      onPressed: () {
                        setState(() {
                          _control.animateToPage(0, duration: Duration(microseconds: 5), curve: Curves.easeIn);
                        });
                      },
                      child: Icon(
                        Icons.list_alt_sharp,
                        color: _index == 0 ? Colors.green : Colors.black,
                      ),
                    ),



                  Icon(
                    Icons.list_alt_outlined,
                    color: _index == 1 ? Colors.green : Colors.black,
                  ),
                  Icon(
                    Icons.line_style_rounded,
                    color: _index == 2 ? Colors.green : Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ]),
      );
  }
}
