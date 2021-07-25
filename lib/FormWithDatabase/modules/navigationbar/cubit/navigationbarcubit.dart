import 'package:flutter/cupertino.dart';
import 'package:flutter_app_work/FormWithDatabase/modules/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../settings_screen.dart';
import 'navigationbarstates.dart';


class NavigationCubit extends Cubit<NavigationState>
{

  NavigationCubit() : super( NavigationInitialState() );

  //make an object from the cubit to make it easy to use :
  static NavigationCubit get (context)=>BlocProvider.of(context);


  final List<Map<String, Object>> pages = [
    {
      'page': Home(),
      'title': "Home",
    },
    {
      'page':Settingss(),
      'title': "Settings",
    },
    {
      'page': Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            strokeWidth: 6,
            backgroundColor: Colors.orange,
            valueColor:AlwaysStoppedAnimation<Color>(Colors.white) ,
          ),
        ),
      ),
      'title': "Chat"
    }
  ];


  int SelectedIndex = 0;

  void x(int index) {
     emit(NavigationLoadingState());
      SelectedIndex = index;
      emit(NavigationSuccessState());
  }


}