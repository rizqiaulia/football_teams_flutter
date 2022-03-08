


import 'package:flutter/material.dart';
import 'package:football_teams/features/teamDetail/presentation/team_detail_screen.dart';
import 'package:football_teams/features/teamList/model/teams_model.dart';
import 'package:football_teams/features/teamList/presentation/team_list_screen.dart';

import '../../main.dart';

class AppRoute {
  static const String defaultRoute = '/';
  static const String teamListScreen = 'teamListScreen';
  static const String teamDetailScreen = 'teamDetailScreen';

static Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name){
    case defaultRoute:
      return MaterialPageRoute(builder: (_) => RouteContainer());

    case teamListScreen:
      return MaterialPageRoute(builder: (_) => TeamListScreen());
      
    case teamDetailScreen :
      return MaterialPageRoute(builder: (_) => TeamDetailScreen(data :settings.arguments as TeamsModel));
      
    default:
      return MaterialPageRoute(builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ));
  }
}
}