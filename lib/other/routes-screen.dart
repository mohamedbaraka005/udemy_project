import 'package:flutter/material.dart';
import 'file:///C:/Users/LENOVO/AndroidStudioProjects/flutter_app_work/lib/other/splash_screen.dart';
import 'PView_screen.dart';
import 'agecalculator.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool decision = prefs.getBool("is visited");
  Widget _FirstScreen = decision == true ? agecalc() : RoutesScreen();
  runApp(_FirstScreen);  // without parenthes ().
}

class RoutesScreen extends StatefulWidget {
  @override
  _RoutesScreenState createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        //"/" : (context) => MainSplashScreen(),
        agecalc.routeName :(context) => agecalc(),
        PViewScreen.routName :(context) => PViewScreen(),
      },
      home: MainSplashScreen(),
    );
  }
}
