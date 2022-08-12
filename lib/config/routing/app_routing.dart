import 'package:flutter/cupertino.dart';
import 'package:raftlabs_assignment/config/routing/app_routes.dart';
import 'package:raftlabs_assignment/presentation/screens/home/home_screen.dart';

mixin Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) =>
      {AppRoutes.initialRoute: (context) => HomeScreen()};
}
