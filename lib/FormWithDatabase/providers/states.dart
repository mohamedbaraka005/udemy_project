abstract class UserState
{
   //uses only to inheritance.
}
class InitialState extends UserState {

}
class CreateUserMode extends UserState {

}
class SigninMode extends UserState {

}
class HidePasswordMode extends UserState {

}
class KeepMeSignedMode extends UserState{}
class ChangeIndicatorMode extends UserState{}