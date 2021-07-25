import 'package:flutter/cupertino.dart';
import 'package:flutter_app_work/FormWithDatabase/models/user_model.dart';
import 'package:flutter_app_work/FormWithDatabase/providers/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class MyCubit extends Cubit<UserState>
{

  MyCubit() : super( InitialState() );

  //make an object from the cubit to make it easy to use :
  static MyCubit get (context)=>BlocProvider.of(context);

  bool SingInMode = false;
  bool KeepMeSigned = false;
  bool ShowPassword = true;
  bool showindecator = false;
  SocialUserModel user;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  void HidPassword() {
      ShowPassword = !ShowPassword;
      emit(HidePasswordMode());
  }

  void ChangeKeepMeSigned(bool value){
    KeepMeSigned = value;
    emit(KeepMeSignedMode());
  }

  void ChangeIndicator(bool value){
    showindecator  = value;
    emit(ChangeIndicatorMode());
  }

  void CheckVerificationFun(ctx){
    FirebaseAuth.instance.currentUser.emailVerified?
    Navigator.of(ctx).pushNamed('/nb') : Navigator.of(ctx).pushNamed('/ve') ;
    emit(state);
  }

  void ChangeSignInMode() {
    SingInMode = !SingInMode ;
    emit(state);
  }

}