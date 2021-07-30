import 'package:flutter/cupertino.dart';
import 'package:flutter_app_work/FormWithDatabase/models/user_model.dart';
import 'package:flutter_app_work/FormWithDatabase/modules/form/cubit/formstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../shared.dart';

class MyCubit extends Cubit<UserState> {
  MyCubit() : super(InitialState());

  //make an object from the cubit to make it easy to use :
  static MyCubit get(context) => BlocProvider.of(context);

  bool SingInMode = true;
  bool KeepMeSigned = false;
  bool ShowPassword = true;
  bool showindecator = false;

  //var uid;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void HidPassword() {
    ShowPassword = !ShowPassword;
    emit(HidePasswordState());
  }

  void ChangeKeepMeSigned(bool value) {
    KeepMeSigned = value;
    emit(KeepMeSignedState());
  }

  void ChangeIndicator(bool value) {
    showindecator = value;
    emit(ChangeIndicatorState());
  }

   CheckVerificationFun(ctx) {

   if(FirebaseAuth.instance.currentUser.emailVerified)
     {
       Navigator.of(ctx).pushNamed('/nb');
       emit(CheckVerificationSuccessState());
     }

   if(FirebaseAuth.instance.currentUser.emailVerified==false)
     {
       Navigator.of(ctx).pushNamed('/ve');
       emit(CheckVerificationLoadingState());
     }

  }

  void ChangeSignInMode() {
    SingInMode = !SingInMode;
    //when i wrote it emit(state) it is not worked !
    emit(SigninState());
  }

  void SaveUser(String uId , SocialUserModel user) {
    emit(SaveUserDataLoadingState());
    user.uId =uId;
    Helper.putString('uid', user.uId);
    FirebaseFirestore.instance
        .collection("Users")
        .doc(uId)
        .set(user.toMap())
        .then((value) {
          print("---------------------------add");
      emit(SaveUserDataSuccessState());
    }).catchError(() {
      print("---------------------------error");
      emit(SaveUserDataErrorState());
    });

  }

  Future<UserCredential> registrationFun() async {

    emit(CreateUserLoadingState());

    SocialUserModel user =SocialUserModel(
      name:nameController.text.toString(),
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
      cover: "https://media.istockphoto.com/photos/happy-smiling-man-looking-away-picture-id1158245623?k=6&m=1158245623&s=612x612&w=0&h=y0LbpRFMHMj_9YC_kpKvLYcijEunxP27KyjXBrDHcFg=",
      image: "https://media.istockphoto.com/photos/happy-smiling-man-looking-away-picture-id1158245623?k=6&m=1158245623&s=612x612&w=0&h=y0LbpRFMHMj_9YC_kpKvLYcijEunxP27KyjXBrDHcFg=",
      isVerified: false,
      bio: "write your bio ..."
    );

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    )
        .then((value) {
      emit(CreateUserSuccessState());
       SaveUser(value.user.uid , user);
    })
        .catchError((onError) {
      emit(CreateUserErrorState());
      print("$onError error occurred-------");
    });
  }

  Future <UserCredential>SigninFun()async {
    emit(SignInLoadingState());
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    )
        .then((value) {
      emit(SignInSuccessState());
      print("sing in finished:--------");
    })
        .catchError((onError){
      emit(SignInErrorState());
      print("an error occurred------- $onError");
    }
    );
  }
}
