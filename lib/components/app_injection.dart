import 'package:football_teams/components/api/team_data_source.dart';
import 'package:football_teams/components/util/network.dart';
import 'package:football_teams/features/repository/team_repository.dart';
import 'package:injectorio/injectorio.dart';

class AppInjection extends Module {
  AppInjection() {
    single(TeamDataSource(Network.dioClient()));
    single(TeamRepository(inject()));
  }
}
