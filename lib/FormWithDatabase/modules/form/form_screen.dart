import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_work/FormWithDatabase/modules/form/cubit/formstate.dart';
import 'package:flutter_app_work/FormWithDatabase/modules/form/cubit/formcubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';
import '../settings_screen.dart';
import '../../TextTormFieldCreation.dart';
import '../Verification_theemail_screen.dart';
import '../navigationbar/navigationbar_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

main() async{
  //initialize the flutter fire
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Form1(),
      initialRoute: '/tt',
      routes: {
        '/tt': (context) => Form1(),
        '/nb': (context) => NavigationBarScreen(),
        '/ve': (context) => VerificateEmail(),
        '/s' : (context)  =>Settingss(),
      },
    );
  }
}

class Form1 extends StatelessWidget {
  @override

  final FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {



    return BlocProvider(
      create: (BuildContext context)=> MyCubit(),
      child: BlocConsumer<MyCubit, UserState>(
        listener: (context,state){},
        builder: (context,state){
          //to make it easy to write:
          //it must be in that place..
          MyCubit cubit = MyCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: Builder(
              builder: (ctx) => SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                        "assets/images/abstract-background-with-smooth-color-wave-transparent-wavy-lines_153082-1507.jpg"),
                    Form(
                      key: FormKey,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              cubit.SingInMode==false
                                  ? CreateTextFormField(
                                  controller: cubit.nameController,
                                  label: "Name",
                                  icon: Icons.text_rotation_none_rounded,
                                  keyboardType: TextInputType.name,
                                  validatoor: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "please enter the name.";
                                    }
                                    return null;
                                  })
                                  : SizedBox(),
                              SizedBox(
                                height: 10,
                              ),
                              CreateTextFormField(
                                  controller: cubit.emailController,
                                  label: "Email",
                                  icon: Icons.email,
                                  keyboardType: TextInputType.emailAddress,
                                  validatoor: (value) {
                                    if (value == null ||
                                        value.isEmpty) {
                                      return "please enter your email.";
                                    }
                                    else if ( !value.contains("@") ||  !value.contains(".com")){
                                      return "please enter a valid email.";
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: 10,
                              ),
                              // TextFormField(
                              //   controller: phoneController,
                              //   keyboardType: TextInputType.phone,
                              //   decoration: InputDecoration(
                              //     //icon: Icon(Icons.phone_android),
                              //     prefixIcon: Padding(
                              //       padding: EdgeInsets.all(0.0),
                              //       child: Icon(
                              //         Icons.phone_android,
                              //         color: Color(0xffff5a5f), //ff5a5f //ffd97d
                              //       ),
                              //     ),
                              //     labelText: "Phone",
                              //     enabledBorder: UnderlineInputBorder(
                              //       // borderSide:
                              //       //     BorderSide(color: Color(0xffff5a5f)),
                              //     ),
                              //     // border: UnderlineInputBorder(),
                              //   ),
                              //   validator: (value) {
                              //     if (value == null ||
                              //         value.isEmpty ||
                              //         value.length != 11) {
                              //       return "please enter a your phone.";
                              //     }
                              //     return null;
                              //   },
                              // ),
                              // SizedBox(
                              //   height: 13,
                              // ),
                              Column(
                                children: [
                                  CreatePasswordFormField(
                                      controller: cubit.passwordController,
                                      label: "Password",
                                      variable: cubit.ShowPassword,
                                      hidePasswordFunction: cubit.HidPassword,
                                      validatoor: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "please enter the password.";
                                        } else if (value.length < 6) {
                                          return " at least 6 digits.";
                                        } else if (value.toLowerCase() == value) {
                                          return "at least one upper case character.";
                                        } else if (value.toUpperCase() == value) {
                                          return " at least one lower case character.";
                                        }
                                        return null;
                                      }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  cubit.SingInMode==false
                                      ? AnimatedContainer(
                                    duration: Duration(seconds: 2),
                                    child: CreatePasswordFormField(
                                        controller: cubit.confirmPasswordController,
                                        label: "Confirm Password",
                                        variable: cubit.ShowPassword,
                                        hidePasswordFunction: cubit.HidPassword,
                                        validatoor: (value) {
                                          if (value == null || value.isEmpty ) {
                                            return "please enter the password.";
                                          } else if(value != cubit.passwordController.text.toString()){
                                            return "password not matched";
                                          }
                                          else if (value.length < 6) {
                                            return " at least 6 digits.";
                                          } else if (value.toLowerCase() == value) {
                                            return "at least one upper case character.";
                                          } else if (value.toUpperCase() == value) {
                                            return " at least one lower case character.";
                                          }
                                          return null;
                                        }),
                                  )
                                      : Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Keep me signed ",
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        Checkbox(
                                          value: cubit.KeepMeSigned,
                                          onChanged: (value) {
                                            cubit.ChangeKeepMeSigned(value);
                                          },
                                          activeColor: Colors.redAccent,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              cubit.showindecator==false ?ElevatedButton(
                                child: Text("Submit"),

                                onPressed: () async{

                                  cubit.ChangeIndicator(true);

                                  if (FormKey.currentState.validate()) {
                                    // Scaffold.of(ctx).showSnackBar(
                                    //     SnackBar(content: Text("processing")));
                                    cubit.SingInMode?
                                    await SigninFun(cubit.emailController.text.toString(),cubit.passwordController.text.toString())
                                        .whenComplete(() {
                                      Navigator.of(ctx).pushNamed('/nb');
                                    })
                                        :
                                    cubit.user =SocialUserModel(
                                      name:cubit.nameController.text.toString(),
                                      email: cubit.emailController.text.toString(),
                                      password: cubit.passwordController.text.toString(),
                                      uId: FirebaseAuth.instance.currentUser.uid,
                                      image: "https://media.istockphoto.com/photos/happy-smiling-man-looking-away-picture-id1158245623?k=6&m=1158245623&s=612x612&w=0&h=y0LbpRFMHMj_9YC_kpKvLYcijEunxP27KyjXBrDHcFg=",
                                    );

                                    await registrationFun(cubit.user)
                                        .whenComplete(() {
                                      cubit.CheckVerificationFun(ctx);
                                    });


                                    cubit.showindecator  = false;


                                    print(cubit.SingInMode);
                                  }
                                },

                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xffe59500)), //b5179e
                                ),
                              ):CircularProgressIndicator(
                                strokeWidth: 4,
                                backgroundColor: Color(0xffe59500),
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    cubit.SingInMode==false
                                        ? "have an account? "
                                        : "don't have account? ",
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      cubit.ChangeSignInMode();
                                    },
                                    child: cubit.SingInMode==false
                                        ? Text(
                                      "Sign In",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    )
                                        : Text(
                                      "Sing Up",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),

    );

  }

}
//
// class _Form1State extends State<Form1> {
//
//
//
//   //data base variables.
//   //bool _initialized = false;
//   // bool _error = false;
//   FirebaseAuth auth = FirebaseAuth.instance;
//
//   //final phoneController = TextEditingController();
//
//
//
//
//   @override
//   void initState() {
//
//     super.initState();
//   }
//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     //phoneController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//
//   }
//
