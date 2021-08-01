import 'package:flutter/material.dart';
import 'package:flutter_app_work/FormWithDatabase/modules/navigationbar/cubit/navigationbarcubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/navigationbarstates.dart';


class NavigationBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return BlocProvider(
       create: (BuildContext context)=> NavigationCubit(),
      child: BlocConsumer<NavigationCubit, NavigationState>(
      listener: (context,state){},
      builder: (context,state){
      NavigationCubit cubit = NavigationCubit.get(context);
      return Scaffold(
        body:cubit.pages[cubit.SelectedIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          //iconSize: 30,
          backgroundColor: Color(0xffe3b23c),
          currentIndex: cubit.SelectedIndex,
          onTap:NavigationCubit.get(context).x,
          selectedItemColor: Color(0xff570000),
          selectedFontSize: 15,
          unselectedItemColor: Color(0xffb80c09),
          unselectedFontSize: 10,
          //when the navigation bar color or label have a problem
          //put the type fixed
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: cubit.pages[0]['title'],
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: cubit.pages[1]['title']),
            BottomNavigationBarItem(
                icon: Icon(Icons.line_style_rounded),
                label: cubit.pages[2]['title']),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: cubit.pages[3]['title']),
          ],
        ),
      );
      },
      ));



  }

}

