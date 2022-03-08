import 'package:dio/dio.dart';
import 'package:football_teams/components/config/apps_const.dart';

class TeamDataSource {
  late final Dio _client;
  final String _url = "https://www.thesportsdb.com/api/v1/json/2/";
  static String errorMsgHandler = "Failed to load, please try again";

  TeamDataSource(this._client);

  Stream<Response<String>> footballTeamsApi() async* {
    try{
      String apiListTeam = 'search_all_teams.php?l=Spanish%20La%20Liga';
      yield await _client.get(_url + apiListTeam);
    }on DioError catch(e){
      if(AppsConst.isDebuggable){
        yield throw Exception(e.message);
      }else{
        yield throw Exception(errorMsgHandler);
      }
    }
  }
}
