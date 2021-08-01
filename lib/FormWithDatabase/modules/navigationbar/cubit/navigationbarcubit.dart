
import 'package:flutter_app_work/FormWithDatabase/modules/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import '../../chat_screen.dart';
import '../../post_screen.dart';
import '../../settings/settings_screen.dart';
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
      'page': ChatScreen(),
      'title': "Chat"
    },
    {
      'page': PostScreen(),
      'title': "Post",
    },
    {
      'page':Settingss(),
      'title': "Settings",
    },

  ];


  int SelectedIndex = 0;

  void x(int index) {
     emit(NavigationLoadingState());
      SelectedIndex = index;
      emit(NavigationSuccessState());
  }


  // SocialUserModel user1 ;
  // getUserData()
  // {
  //   emit(state);
  //   FirebaseFirestore.instance
  //       .collection('Users')
  //       .doc('${Helper.getString("uid")}')
  //       .get()
  //       .then((value) {
  //     user1 = SocialUserModel.fromJson(value.data());
  //     emit(state);
  //   })
  //       .catchError((onError){
  //     emit(state);
  //   });
  // }


}