import 'package:flutter/material.dart';
import 'package:football_teams/components/config/apps_const.dart';
import 'package:injectorio/injectorio.dart';

import 'components/app_injection.dart';
import 'components/config/apps_route.dart';
import 'features/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InjectorIO.start(mode: InjectorMode.DEBUG).module(AppInjection());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppsConst.appName,
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: AppRoute.defaultRoute,
      theme: ThemeData(
          primarySwatch: Colors.red
      ),
    );
  }
}

class RouteContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
