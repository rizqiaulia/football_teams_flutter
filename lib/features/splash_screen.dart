import 'package:flutter/material.dart';
import 'package:football_teams/components/config/apps_route.dart';

class SplashScreen extends StatefulWidget{

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
  
 

}

class _SplashScreenState  extends State<SplashScreen>{

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.pushReplacementNamed(context, AppRoute.teamListScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Ini Splash Screen"),
      ),
    );
  }


}