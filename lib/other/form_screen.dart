import 'package:flutter/material.dart';
main()
{
  runApp(FormScreen());
}
class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}
enum AuthMode {login , signUp} //show enum position.
class _FormScreenState extends State<FormScreen> {
  //to check the mode we created an enum and take variable form it .
  AuthMode _authMode = AuthMode.login;

  //map for the data .
  Map <String  , String> AuthData = {
    "email" :  '',
    "password" : '',
  };

  //key for the functions save and validate.
  final GlobalKey <FormState> FormKey  = GlobalKey();

  //controller to check if password match with confirm password.
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text(_authMode==AuthMode.login?"Login":"SignUp"),
      ),
        body: Center(
          child: Form(
            key: FormKey,
           child: SingleChildScrollView(
             child: Padding(
               padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
               child: Column(
                 children: [
                   TextFormField(
                     decoration: InputDecoration(labelText: "E_Mail"),
                     keyboardType:TextInputType.emailAddress ,
                     keyboardAppearance: Brightness.dark,
                     validator: (val){
                       if(val.isEmpty || !val.contains("@") || !val.contains(".com"))
                         {
                           return "Invalid Email.";
                         }
                       else
                         {
                           return null;
                         }
                     },
                     onSaved: (val){
                       AuthData["email"] = val;
                     },
                   ),

                   TextFormField(
                     decoration: InputDecoration(labelText: "Password"),
                     //keyboardType:TextInputType.visiblePassword ,
                     //keyboardAppearance: Brightness.light,
                     controller: passwordController ,

                     obscureText: true,

                     validator: (val){
                       if(val.isEmpty || val.length<6 )
                       {
                         return "Invalid Email.";
                       }
                       else
                       {
                         return null;
                       }
                     },
                     onSaved: (val){
                       AuthData["password"] = val;
                     },
                   ),
                   if(_authMode == AuthMode.signUp)//if without {}
                       TextFormField(
                         decoration: InputDecoration(labelText: "Confirm Password"),
                         //keyboardType:TextInputType.visiblePassword ,
                         //keyboardAppearance: Brightness.light,
                         obscureText: true,
                         validator: _authMode==AuthMode.signUp?(val){
                           if(val.isEmpty || val != passwordController.text )
                           {
                             return "Password does not match.";
                           }
                           else
                           {
                             return null;
                           }
                         }:null

                           // you can write it more simple like that but hassan mentioned some problem that may be happen.
                         // {
                         //                            (val){
                         //                            if(val.isEmpty || val != passwordController.text )
                         //                            {
                         //                              return "Password does not match.";
                         //                            }
                         //                            else
                         //                            {
                         //                              return null;
                         //                            }
                         // }

                       ),

                   RaisedButton(
                     child: Text(_authMode==AuthMode.login?"Login":"SignUp"),
                       onPressed: _submit),
                   FlatButton(onPressed: _switch, child: Text(" ${_authMode==AuthMode.login?"SignUp":"Login"} Instead ")) // very important note ######
                 ],
               ),
             ),
           ),

          ),
        ),
    )
    );
  }

  void _submit() {

    //check validation .
    if(!FormKey.currentState.validate())
      {
        return;
      }


  //save the data.
    FormKey.currentState.save();

    //navigate to the other page.
    if(_authMode == AuthMode.login)
      {
        //login statements.
      }
    else
      {
        //sing up statements .
      }

  }

  void _switch() {
    setState(() {
      if(_authMode==AuthMode.login)
        {
          _authMode = AuthMode.signUp;
        }
      else
        {
          _authMode = AuthMode.login;
        }
    });
  }
}
