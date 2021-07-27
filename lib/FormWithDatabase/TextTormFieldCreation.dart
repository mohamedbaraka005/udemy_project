import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CreateTextFormField(  {TextEditingController controller  , String label ,IconData icon, TextInputType keyboardType , Function validatoor}  )
{
  return TextFormField(
    controller: controller,

    //the size of the text and may be can be used for all the textformfield.
    //style: TextStyle(fontSize: 10),

    cursorColor: Colors.red,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      //icon: Icon(Icons.text_rotation_none_rounded),
      prefixIcon: Padding(
        padding: EdgeInsets.all(0.0),
        child: Icon(
          icon,
          color:
          Color(0xffff5a5f), //ff5a5f //ffd97d
        ),
      ),

      labelText: label,

      //this border change the color.
      enabledBorder: UnderlineInputBorder(
        // borderSide:
        //     BorderSide(color: Color(0xffff5a5f)),
      ),

      //this border the color wont be changed.
      /* border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red
                                        )
                                    ),*/

    ),
    validator: validatoor,
    autovalidateMode: AutovalidateMode.onUserInteraction ,
  );
}

Widget CreatePasswordFormField({TextEditingController controller ,String label, bool variable , Function hidePasswordFunction ,Function validatoor})
{
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.visiblePassword,
    decoration: InputDecoration(
      //icon: Icon(Icons.remove_red_eye),
      prefixIcon: InkWell(
        onTap: () {
          hidePasswordFunction();
        },
        child: Icon(
          variable
              ? Icons.remove_red_eye
              : Icons.lock,
          color: Color(0xffff5a5f), //ff5a5f //ffd97d
        ),
      ),
      labelText: label,
      enabledBorder: UnderlineInputBorder(
        // borderSide: BorderSide(
        //     color: Color(0xffff5a5f)),
      ),
      // border: UnderlineInputBorder(),
    ),
    obscureText: variable ? false : true,
    validator:validatoor,
    autovalidateMode: AutovalidateMode.onUserInteraction ,
  );
}





// Future <void> StoreDataFun(String userId ,String email, String password , String name)async
// {
//   await FirebaseFirestore.instance.collection("Users").doc(userId).set(
//       {
//     "name":name,
//     "email":email,
//     "password":password,
//   }
//   );
// }