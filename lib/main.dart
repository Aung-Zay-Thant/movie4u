import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:movie_suggestions_4_u/Utility/router.dart';

void main(){
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      getPages: Routers.route,
      initialRoute: 'mainScreen',
    )
  );
}