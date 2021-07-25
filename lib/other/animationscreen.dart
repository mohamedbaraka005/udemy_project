import 'package:flutter/material.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as SlideDialog;

main() {
  runApp(screen1());
}


class screen1 extends StatefulWidget {
  @override
  _screen1State createState() => _screen1State();
}

class _screen1State extends State<screen1> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Built_in Animation"),
          ),
          body: Container(
              child: Center(
                child: Builder(
                  //i added a builder because i face a problem with the context.
                  builder: (ctx)=>FlatButton(
                      child: Text("Click"),
                      //////////////////////////////////////////////////////////////////////////////
                      onPressed: () {
                        //SlideDialog is the name you created when importing the package.
                        SlideDialog.showSlideDialog(
                            context: ctx,
                            //child is the content of the slide dialoge.
                            child: Center(
                                 child: Text("this the Slide Pop Dialoge"),
                        ),
                            //when you click on any position in the screen the menu closed.
                            barrierDismissible: true,
                           //duration for opening and closing the menu such the animation duration.
                          transitionDuration: Duration(seconds: 1),
                          //the color for the small line .
                          pillColor: Colors.red,
                          //the color for the background.
                          backgroundColor: Colors.green,
                          //it is better if you put this color with opacity.
                          barrierColor: Colors.blueAccent.withOpacity(0.3),
                        );

                      }
                  ),
                ),

              )
          )),
    );
  }

}
