import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_teams/features/repository/team_repository.dart';
import 'package:football_teams/features/teamList/presentation/team_list_state.dart';
import 'package:rxdart/rxdart.dart';

class TeamListCubit extends Cubit<TeamListState> {
  final TeamRepository _repository;

  TeamListCubit(this._repository) : super(TeamListInit());

  void getTeam() async {
    _repository.getListTeam()
        .doOnListen(() => emit(TeamListLoading()))
        .map<TeamListState>((event) => TeamListSuccess(event))
        .onErrorReturnWith((error, e) => TeamListFailed(error.toString()))
        .listen(emit);
  }
}
