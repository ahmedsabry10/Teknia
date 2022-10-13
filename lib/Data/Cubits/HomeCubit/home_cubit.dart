import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknia/Data/Cubits/HomeCubit/home_states.dart';
import 'package:teknia/Data/Shared/Styles/icon_broken.dart';
import 'package:teknia/Screens/HomeScreens/date_screen.dart';
import 'package:teknia/Screens/HomeScreens/mabiaat_screen.dart';
import 'package:teknia/Screens/HomeScreens/moshtraiat.dart';
import 'package:teknia/Screens/HomeScreens/total_safe.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    SalesScreen(), //المبيعات
    purchasesScreen(),  // المشترياات
    TotalSafe(), //الاصناف
    DateScreen(), //العملاء

  ];

  String? valueChoose;
  List<String> listItem = [
    'مخزنى',
    'خدمى - بنود اعمال',
    'مجمع',
    'منتج تام',
    'متعدد'
  ];
  String? valueItem;

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeButtonNavBarState());
  }

  List<String> titlePages = [
    'مبيعات',
    'مشتريات',
    'اجمالى خزينه',
    'مديونيات العملاء',


  ];

  List<IconData> icons = [
    Icons.shop_2_outlined,
    IconBroken.Buy,
    IconBroken.Category,
    IconBroken.Paper,
  ];





  IconData fabIcon = IconBroken.Arrow___Down_2;
  bool isBottomSheetShown = false;
  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }){
    isBottomSheetShown=isShow;
    fabIcon =icon ;
    emit(AppChangeBottomSheetState());
  }
}
