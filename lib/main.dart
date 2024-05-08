import 'package:case_study/core/routing/myroute.dart';
import 'package:case_study/dashbord/view/page/dashbord_page.dart';
import 'package:flutter/material.dart';

void main() {
  MaterialApp materialApp=MaterialApp(
   // home:dashbordPage(),
onGenerateInitialRoutes: (_) => MyRoute.intialRoutes,
onGenerateRoute: MyRoute.onNavigateByName,
    );
  runApp(materialApp);
}

