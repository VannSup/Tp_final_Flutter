import 'package:flutter/material.dart';
import 'package:tp_final/app/screens/home/home_screen.dart';
import 'package:tp_final/app/screens/home-details/home_details_screen.dart';


const kMainRoute = '/home';
const kHomeRoute = '/home';
const kHomeDetailsRoute = '/home-details';

final Map<String, WidgetBuilder> kRoutes = {
  kMainRoute: (_) => HomeScreen(),
  kHomeDetailsRoute: (_) => HomeDetailsScreen(),
};

onGenerateRoute(settings) {

}