import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_app_work/FormWithDatabase/modules/settings/cubit/settingsCubit.dart';
import 'package:flutter_app_work/FormWithDatabase/modules/settings/cubit/settingsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatelessWidget {
  // const EditProfile({Key? key}) : super(key: key);
  var newName = TextEditingController();
  var newEmail = TextEditingController();
  var newPassword = TextEditingController();
  var newPhone = TextEditingController();
  var newBio =  TextEditingController();
  var confirmPassword= TextEditingController();

  final _FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit,SettingsState>(
        listener: (context,state){
        },
        builder: (context,state){
          var cubit = SettingsCubit.get(context);
          newName.text = cubit.user1.name;
          newPhone.text = "01281216159";
          newEmail.text=cubit.user1.email;
          newBio.text = cubit.user1.bio;
          print('+++++++++++++++++++++++${SettingsCubit.get(context).user1}');
          return  Scaffold(
              appBar: AppBar(
                title: Text("Edit Profile" ,style: TextStyle(
                    color: Colors.black
                ),),
                backgroundColor: Colors.white,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(left: 10 , right: 13 ,top:  10 , bottom: 10),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(5),
                            border: Border.all(color: Colors.blueAccent)
                        ),
                        child: InkWell(
                          onTap: (){
                            if (_FormKey.currentState.validate())
                              {

                                cubit.UpdateProfileData(newName.text.toString(), newEmail.text.toString(), newPassword.text.toString(), newBio.text.toString());
                                Navigator.pop(context);

                              }
                          },
                          highlightColor: Colors.blueAccent,
                          child: Padding(
                              padding: EdgeInsets.only(left: 5, right: 5 ,top: 2 ,bottom: 7),
                              child: Icon(Icons.done , color: Colors.blueAccent,size: 30)),
                        )),
                  ),
                ],
                leading: InkWell(
                    onTap:(){Navigator.pop(context);},
                    child: Icon(Icons.keyboard_return , color: Colors.blueAccent,)),
              ),
              body:Container(
                child: Form(
                  key: _FormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Expanded(
                              child: TextFormField(
                                controller: newName,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.person),
                                  labelText: "Name",
                                  enabledBorder: UnderlineInputBorder(
                                  ),
                                ),
                                validator: (value) {
                                   if (value.length < 6) {
                                     return " at least 6 digits.";
                                   }
                                  return null;
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction ,
                              ),
                            ),
                            SizedBox(width: 10,),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Expanded(
                              child: TextFormField(
                                controller: newBio,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.line_weight),
                                  labelText: "Bio",
                                  enabledBorder: UnderlineInputBorder(
                                  ),
                                ),
                                validator: (value) {
                                   if (value.length < 6) {
                                    return " at least 6 digits.";
                                  }
                                   else if (value.length > 25) {
                                    return "too long bio";
                                  }
                                  return null;
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction ,
                              ),
                            ),
                            SizedBox(width: 10,),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Expanded(
                              child: TextFormField(
                                controller: newPhone,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.phone_android),
                                  labelText: "Phone",
                                  enabledBorder: UnderlineInputBorder(
                                  ),
                                  // border: UnderlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value.length < 11) {
                                    return "enter a valid phone number";
                                  }
                                  return null;
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction ,
                              ),
                            ),
                            SizedBox(width: 10,),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Expanded(
                              child: TextFormField(
                                controller: newEmail,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.email_rounded),
                                  labelText: "Email",
                                  enabledBorder: UnderlineInputBorder(
                                  ),
                                  // border: UnderlineInputBorder(),
                                ),
                                validator: (value) {
                                   if ( !value.contains("@") ||  !value.contains(".com")){
                                    return "please enter a valid email.";
                                  }
                                  return null;
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction ,
                              ),
                            ),
                            SizedBox(width: 10,),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Expanded(
                              child: TextFormField(
                                controller: newPassword,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.vpn_key ),
                                  suffixIcon:InkWell(
                                    child: Icon(cubit.showPassword?Icons.remove_red_eye:Icons.lock),
                                    onTap: (){
                                      cubit.ChangeShowPassword();
                                    },
                                  ) ,
                                  labelText: "new Password",
                                  enabledBorder: UnderlineInputBorder(
                                  ),
                                ),
                                obscureText: cubit.showPassword ? false : true,
                                validator: (value) {

                                  if (value.length >0){
                                    if ( value.length < 6) {
                                      return " at least 6 digits.";
                                    } else if (value.toLowerCase() == value) {
                                      return "at least one upper case character.";
                                    } else if (value.toUpperCase() == value) {
                                      return " at least one lower case character.";
                                    }
                                  }

                                  return null;
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction ,
                              ),
                            ),
                            SizedBox(width: 10,),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Expanded(
                              child: TextFormField(
                                controller: confirmPassword,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.vpn_key ),
                                  suffixIcon:InkWell(
                                    child: Icon(cubit.showPassword?Icons.remove_red_eye:Icons.lock),
                                    onTap: (){
                                      cubit.ChangeShowPassword();
                                    },
                                  ) ,
                                  labelText: "Confirm Password",
                                  enabledBorder: UnderlineInputBorder(
                                  ),
                                  // border: UnderlineInputBorder(),
                                ),
                                obscureText: cubit.showPassword ? false : true,
                                validator: (value) {
                                  if (newPassword.text.toString().length >0){
                                    if(value != confirmPassword.text.toString()){
                                      return "password not matched";
                                    }
                                    else if (value.length < 6) {
                                      return " at least 6 digits.";
                                    } else if (value.toLowerCase() == value) {
                                      return "at least one upper case character.";
                                    } else if (value.toUpperCase() == value) {
                                      return " at least one lower case character.";
                                    }
                                  }

                                  return null;
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction ,
                              ),
                            ),
                            SizedBox(width: 10,),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ));
        },
      );


  }
}
