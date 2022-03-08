
import 'package:football_teams/features/teamList/model/response_data_model.dart';

abstract class TeamListState{}

class TeamListInit extends TeamListState{}
class TeamListLoading extends TeamListState{}
class TeamListSuccess extends TeamListState{

  final ResponseData teamData;

  TeamListSuccess(this.teamData);
}

class TeamListFailed extends TeamListState{
  late final String message;
  TeamListFailed(this.message);
}
