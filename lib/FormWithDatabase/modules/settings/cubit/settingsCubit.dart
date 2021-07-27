import 'package:flutter_app_work/FormWithDatabase/models/user_model.dart';
import 'package:flutter_app_work/FormWithDatabase/modules/settings/cubit/settingsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../shared.dart';

class SettingsCubit extends Cubit<SettingsState>
{

  SettingsCubit() : super( SettingsInitialState() );

  //make an object from the cubit to make it easy to use :
  static SettingsCubit get (context)=>BlocProvider.of(context);
  SocialUserModel user1 ;
   void getUserData()
  {
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance
        .collection('Users')
        .doc('${Helper.getString("uid")}')
        .get()
        .then((value) {
          //print("-+-+-+-+-+-+-+${value.data()}");
          user1 = SocialUserModel.fromJson(value.data());
          emit(GetUserDataSuccessState());
    })
        .catchError((onError){
        emit(GetUserDataErrorState());
      });
  }

   bool Loading = true;
   void changeLoading(bool value)
   {
     Loading = value;
     emit(state);
   }



}