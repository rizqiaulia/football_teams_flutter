import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:football_teams/components/api/team_data_source.dart';
import 'package:football_teams/components/config/apps_const.dart';
import 'package:football_teams/features/teamList/model/response_data_model.dart';

class TeamRepository {
  final TeamDataSource _dataSource;

  TeamRepository(this._dataSource);

  Stream<ResponseData> getListTeam() =>
      _dataSource.footballTeamsApi().map(_mapToJson).map((event) {
        ResponseData response = ResponseData.fromJson(event);
        log('cekk 5 $response');
        return response;
      });

  _mapToJson(Response<String> event) {
    try {
      log('cekk 1 ${jsonDecode(event.data!)}');
      return jsonDecode(event.data!);
    } catch (e) {
      log('cekk 2 $event');
      if (AppsConst.isDebuggable) {
        log('cekk 3 $event');
        throw Exception(e);
      } else {
        log('cekk 4 $event');
        throw Exception(TeamDataSource.errorMsgHandler);
      }
    }
  }
}
