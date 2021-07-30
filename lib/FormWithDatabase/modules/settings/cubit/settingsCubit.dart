

import 'dart:io';

import 'package:flutter_app_work/FormWithDatabase/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_work/FormWithDatabase/modules/settings/cubit/settingsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../shared.dart';

class SettingsCubit extends Cubit<SettingsState>
{

  SettingsCubit() : super( SettingsInitialState() );

  //make an object from the cubit to make it easy to use :
  static SettingsCubit get (context)=>BlocProvider.of(context);
  SocialUserModel user1 ;
   void getUserData()
  {
    //print('+++++++++++++++++++++++${user1.name}');
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance
        .collection('Users')
        .doc('${Helper.getString("uid")}')
        .get()
        .then((value) {
          emit(state);
          //print("-+-+-+-+-+-+-+${value.data()}");
          user1 = SocialUserModel.fromJson(value.data());
          emit(GetUserDataSuccessState());
          print("Get data ended");
          print('+++++++++++++++++++++++${user1.name}');
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




  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////to update the cover image ///////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // the algorithm for change the profile image
  // . pick the image .
  // . upload the image and get the URL.
  // . when the upload complete ,update the image.
  void ShowBottomSheetForProfile(context){
    showMaterialModalBottomSheet(
      //elevation: 100,
      context: context,
      builder: (context) => Container(
        height:118,
        child: Column(
          children: [
            SizedBox(height: 4,),
            ListTile(
              onTap: (){
                //to close the bottom sheet and do what you want :
                Navigator.pop(context);
                getProfileImage()
                    .then((value)
                {
                  //to handle if the user open the picker and close without choose an image:
                  if(state is ProfileImagePickedSuccessState)
                  {

                    uploadProfileImage();
                    emit(UpdateProfileImageLoadingState());
                  }
                  else
                  {

                  }
                })
                    .catchError(onError);
              },
              title: Text("Select Profile Picture"),
              leading: Icon(Icons.image),
            ),
            ListTile(
              onTap: (){},
              title: Text("Show Profile Picture"),
              leading: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }

  //be aware you must import dart.io not dart.html
   File profileImage;
   var picker = ImagePicker();
   Future<void> getProfileImage() async
   {
     final pickedFile = await picker.getImage(
       source: ImageSource.gallery,
     );
     if(PickedFile != null )
       {
         profileImage = File(pickedFile.path);
         emit(ProfileImagePickedSuccessState());
       }
     else
       {
         print("no image");
         emit(ProfileImagePickedErrorState());
       }
   }


   String ProfileImageUrl = '';
   void uploadProfileImage()
   {
      firebase_storage.FirebaseStorage.instance
         .ref()//to enter the storage
         .child('Users/${Uri.file(profileImage.path).pathSegments.last}') //to create the folder and the name of image
         .putFile(profileImage)//the image
         .then((value){
           value.ref.getDownloadURL()
               .then((value) {
                 ProfileImageUrl = value;
                 UpdateProfileImage();
                 emit(UploadProfileImageSuccessState());
               })
               .catchError((onError){emit(UploadProfileImageErrorState());});
     })
         .catchError((onError){emit(UploadProfileImageErrorState());});
   }

   void UpdateProfileImage()
   {
     SocialUserModel user =SocialUserModel(
         name:user1.name,
         email: user1.email,
         password: user1.password,
         cover:user1.cover,
         image: ProfileImageUrl,
         isVerified: true,
         bio: user1.bio
     );
     FirebaseFirestore.instance
         .collection('Users')
         .doc(Helper.getString('uid'))
         .update(user.toMap())
         .then((value) {

           getUserData();

         })
         .catchError((onError){});
   }

   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   ///////////////////////////////////////////to update the cover image ///////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  void ShowBottomSheetForCover(context){
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height:118,
        child: Column(
          children: [
            SizedBox(height: 4,),
            ListTile(
              onTap: (){
                //to close the bottom sheet and do what you want :
                Navigator.pop(context);
                getCoverImage()
                    .then((value)
                {
                  //to handle if the user open the picker and close without choose an image:
                  if(state is CoverImagePickedSuccessState)
                  {

                    uploadCoverImage();
                    emit(UpdateCoverImageLoadingState());
                  }
                  else
                  {

                  }
                })
                    .catchError(onError);
              },
              title: Text("Select Cover Picture"),
              leading: Icon(Icons.image),
            ),
            ListTile(
              onTap: (){},
              title: Text("Show Cover Picture"),
              leading: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }

  File coverImage;
  //var picker = ImagePicker();
  Future<void> getCoverImage() async
  {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if(PickedFile != null )
    {
      coverImage = File(pickedFile.path);
      emit(CoverImagePickedSuccessState());
    }
    else
    {
      print("no image");
      emit(CoverImagePickedErrorState());
    }
  }


  String coverImageUrl = '';
  void uploadCoverImage()
  {
    firebase_storage.FirebaseStorage.instance
        .ref()//to enter the storage
        .child('Users/${Uri.file(coverImage.path).pathSegments.last}') //to create the folder and the name of image
        .putFile(coverImage)//the image
        .then((value){
      value.ref.getDownloadURL()
          .then((value) {
        coverImageUrl = value;
        UpdateCoverImage();
        emit(UploadCoverImageSuccessState());
      })
          .catchError((onError){emit(UploadCoverImageErrorState());});
    })
        .catchError((onError){emit(UploadCoverImageErrorState());});
  }

  void UpdateCoverImage()
  {
    SocialUserModel user =SocialUserModel(
        name:user1.name,
        email: user1.email,
        password: user1.password,
        cover:coverImageUrl,
        image: user1.image,
        isVerified: true,
        bio: user1.bio
    );
    FirebaseFirestore.instance
        .collection('Users')
        .doc(Helper.getString('uid'))
        .update(user.toMap())
        .then((value) {

      getUserData();

    })
        .catchError((onError){});
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////      Update Profile Screen        ///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  bool showPassword = false;
  void ChangeShowPassword()
  {
    showPassword = !showPassword;
    emit(ChangePasswordVisibility());
  }

  void UpdateProfileData(name , email , password , bio)
  {
    emit(UpdateProfileDataLoadingState());
    SocialUserModel user =SocialUserModel(
      //first check if he fill the fields.
        name:name == null?user1.name : name,
        email:email == null?user1.email : email,
        password: password == null? user1.password : password,
        cover:user1.cover,
        image: user1.image,
        isVerified: true,
        bio: bio == null ? user1.bio : bio,
        uId: user1.uId,
        phone: "12345678911"
    );
    FirebaseFirestore.instance
        .collection('Users')
        .doc(Helper.getString('uid'))
        .update(user.toMap())
        .then((value) {
      print("update ended");
      getUserData();
    })
        .catchError((onError){});
  }
}