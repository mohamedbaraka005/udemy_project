import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'agecalculator.dart';
class MainSplashScreen extends StatefulWidget {
  @override
  _MainSplashScreenState createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  void x ()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("is visited", true);
    
  }

  @override
  void initState() {
   x();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: SplashScreen(
            seconds: 3,
            title:Text("Splash Screen"),
            backgroundColor: Colors.blueAccent,
            loaderColor: Colors.red,
            loadingText: Text("Please wait. . . "),
            image: Image.asset("assets/images/FB_IMG_15390268291817510.jpg"),
            photoSize: 180,
            navigateAfterSeconds: agecalc(),
          ),
        );
      
  }
}
