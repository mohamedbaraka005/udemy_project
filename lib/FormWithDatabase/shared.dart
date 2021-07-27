import 'package:shared_preferences/shared_preferences.dart';
class Helper
{
  static SharedPreferences sharedPreferences ;

  static init() async
  {
     sharedPreferences = await SharedPreferences.getInstance();
  }

  static putString( String key, String value)
  {
    sharedPreferences.setString(key, value);
  }

  static getString( String key)
  {
    print("+++++++++++++++++++++++++++++++++++++++++++++++++++${sharedPreferences.getString(key)}");
    return sharedPreferences.getString(key);


  }
}