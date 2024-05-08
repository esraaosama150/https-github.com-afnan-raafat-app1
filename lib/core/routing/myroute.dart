import 'package:case_study/dashbord/view/page/dashbord_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyRoute{
 static  List<Route<dynamic>>  intialRoutes =[
    MaterialPageRoute(builder: (_) =>  const dashbordPage())];



 static Route<dynamic> onNavigateByName(RouteSettings settings){

  switch(settings.name){
    case 'dashbord':
    return MaterialPageRoute(builder: (_) => const dashbordPage());
    default:
    return MaterialPageRoute(builder: (_) => const dashbordPage());
  }
   }
 }

