abstract class SettingsState
{

}
class SettingsInitialState extends SettingsState {

}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////     Get User Data     ////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class GetUserDataLoadingState extends SettingsState {

}
class GetUserDataSuccessState extends SettingsState {

}
class GetUserDataErrorState extends SettingsState {

}
class ChangeLoadingState extends SettingsState {

}




////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////     to Change the Profile image    //////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class ProfileImagePickedSuccessState extends SettingsState {

}
class ProfileImagePickedErrorState extends SettingsState {

}

class UploadProfileImageLoadingState extends SettingsState {

}
class UploadProfileImageSuccessState extends SettingsState {

}
class UploadProfileImageErrorState extends SettingsState {

}

class UpdateProfileImageLoadingState extends SettingsState {

}
class UpdateProfileImageSuccessState extends SettingsState {

}
class UpdateProfileImageErrorState extends SettingsState {

}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////        to Change the Profile image         /////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class CoverImagePickedSuccessState extends SettingsState {

}
class CoverImagePickedErrorState extends SettingsState {

}

class UploadCoverImageLoadingState extends SettingsState {

}
class UploadCoverImageSuccessState extends SettingsState {

}
class UploadCoverImageErrorState extends SettingsState {

}

class UpdateCoverImageLoadingState extends SettingsState {

}
class UpdateCoverImageSuccessState extends SettingsState {

}
class UpdateCoverImageErrorState extends SettingsState {

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////      Update Profile Screen        ///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class ChangePasswordVisibility extends SettingsState {
}
class UpdateProfileDataLoadingState extends SettingsState{}
class UpdateProfileDataSuccessState extends SettingsState{}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////           Post Screen             ///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class WritingState extends SettingsState{}
class DeletePostImageState extends SettingsState{}


class UploadPostImageLoadingState extends SettingsState{}
class UploadPostImageSuccessState extends SettingsState{}
class UploadPostImageErrorState extends SettingsState{}


class CreatePostLoadingState extends SettingsState{}
class CreatePostSuccessState extends SettingsState{}
class CreatePostErrorState extends SettingsState{}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////            Home Screen            ///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class GetPostsDataLoadingState extends SettingsState {

}
class GetPostsDataSuccessState extends SettingsState {

}
class GetPostsDataErrorState extends SettingsState {

}


class SendLikeLoadingState extends SettingsState {

}
class SendLikeSuccessState extends SettingsState {

}
class SendLikeErrorState extends SettingsState {

}

class SendCommentLoadingState extends SettingsState {

}
class SendCommentSuccessState extends SettingsState {

}
class SendCommentErrorState extends SettingsState {

}