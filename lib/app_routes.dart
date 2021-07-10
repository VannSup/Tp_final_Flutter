import 'package:flutter/material.dart';
import 'package:tp_final/app/screens/home/home_screen.dart';
import 'package:tp_final/app/screens/home-details/home_details_screen.dart';

import 'app/modules/note/model/note_model.dart';

const kMainRoute = '/home';
const kHomeDetailsRoute = '/home-details';

final Map<String, WidgetBuilder> kRoutes = {
  kMainRoute: (_) => HomeScreen(),
};

onGenerateRoute(settings) {
  if (settings.name == kHomeDetailsRoute) {
    Note arg = settings.arguments;
    return MaterialPageRoute(builder: (_) => HomeDetailsScreen(note: arg));
  }
}
