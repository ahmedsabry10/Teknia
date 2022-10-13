
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknia/Data/Cubits/LoginCubit/login_states.dart';
import 'package:teknia/Data/Shared/Styles/icon_broken.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginInitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);



  IconData suffix =IconBroken.Show;
  bool isPassword=true;
  void changePasswordVisibility(){
    suffix=isPassword ?IconBroken.Hide:IconBroken.Show;
    isPassword =! isPassword;
    emit(SocialChangePasswordVisibilityState());
  }
}