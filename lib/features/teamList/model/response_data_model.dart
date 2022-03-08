
import 'package:football_teams/features/teamList/model/teams_model.dart';

class ResponseData {
  List<TeamsModel>? teams;

  ResponseData(this.teams);

  ResponseData.fromJson(Map<String, dynamic> json) {
    if(json['teams'] != null){
      teams = <TeamsModel>[];
      json['teams'].forEach((v){
        teams!.add(TeamsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teams'] = teams!.map((e) => e.toJson()).toList();
    return data;
  }
}