import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
class VerificateEmail extends StatefulWidget {
 // const VerificateEmail({Key? key}) : super(key: key);
  @override
  _VerificateEmailState createState() => _VerificateEmailState();
}

class _VerificateEmailState extends State<VerificateEmail> {
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body: Column(
        children: [
          SizedBox(height: 24,),
         Container(
           color: Color(0xffe3b23c).withOpacity(0.6),
            child: Row(
             children: [
               SizedBox(width: 10,),
               Text("Verify your email"),
               SizedBox(width: 120,),
               FlatButton(
                   onPressed: (){
                     FirebaseAuth.instance.currentUser.sendEmailVerification()
                         .then((value) => null)
                         .catchError((onError){print("$onError an error occured--------");});

                   },
                   child: Text("Send" , style: TextStyle(color: Color(0xff570000)),)
               ),



             ],
            ),
          ),
          Container(
            child: FlatButton(
              child: Text("Check"),
              onPressed: (){
                setState(() {
                  FirebaseAuth.instance.currentUser.reload();
                  FirebaseAuth.instance.currentUser.emailVerified == true ? Navigator.of(context).pushReplacementNamed('/nb'):print("Still not verified---");
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
