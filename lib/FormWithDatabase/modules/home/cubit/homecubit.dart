
import 'package:flutter_bloc/flutter_bloc.dart';


import 'homestates.dart';


class HomeCubit extends Cubit<HomeState>
{

  HomeCubit() : super( HomeInitialState() );

  //make an object from the cubit to make it easy to use :
  static HomeCubit get (context)=>BlocProvider.of(context);





}