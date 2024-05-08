import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dashbord_state.dart';

class DashbordCubit extends Cubit<DashbordState> {
  ///dashbord config
  PageController pageController=PageController();
  int currentindex=0;
  void onChangeTab(int index){
     currentindex= index;
     pageController.jumpToPage(index);
     emit(DashbordInitial());
  }
  DashbordCubit() : super(DashbordInitial());
}
