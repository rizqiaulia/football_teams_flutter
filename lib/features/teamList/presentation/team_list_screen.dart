import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_teams/components/config/apps_route.dart';
import 'package:football_teams/components/util/alert.dart';
import 'package:football_teams/features/teamList/model/teams_model.dart';
import 'package:football_teams/features/teamList/presentation/team_list_cubit.dart';
import 'package:football_teams/features/teamList/presentation/team_list_state.dart';
import 'package:injectorio/injectorio.dart';

class TeamListScreen extends StatefulWidget {
  const TeamListScreen({Key? key}) : super(key: key);

  @override
  _TeamListScreenState createState() => _TeamListScreenState();
}

class _TeamListScreenState extends State<TeamListScreen> {
  late TeamListCubit _cubit;
  List<TeamsModel>? listTeam;
  List<TeamsModel>? searchResult;
  late bool _isSearching;
  Icon customIcon = const Icon(Icons.search);
  Widget appBarTitle = const Text('Spanish La Liga');

  @override
  void initState() {
    _isSearching = false;
    _cubit = TeamListCubit(get())..getTeam();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _body(),
    );
  }

  PreferredSizeWidget _appbar() {
    return AppBar(
      title: appBarTitle,
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  appBarTitle = const ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: "Type team name",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none
                      ),
                      style: TextStyle(
                        color: Colors.white
                      ),

                    ),
                  );
                  _isSearching = true;
                } else {
                  customIcon = const Icon(Icons.search);
                  appBarTitle = const Text('Spanish La Liga');
                  _isSearching = false;
                }
              });
            },
            icon: customIcon)
      ],
    );
  }

  Widget _body() {
    return BlocConsumer(
        bloc: _cubit,
        listener: (BuildContext context, state) {
          if (state is TeamListFailed) {
            simpleAlert(context, "Error", state.message);
          }
        },
        builder: (context, state) {
          if (state is TeamListLoading) {
            return _loading();
          }

          if (state is TeamListSuccess) {
            listTeam = state.teamData.teams;
            return _contentBody(listTeam);
          }

          return Container();
        });
  }

  Widget _loading() => Center(child: CircularProgressIndicator());

  Widget _contentBody(List<TeamsModel>? teams) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        padding: EdgeInsets.all(8.0),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: teams!.map((team) => _itemTeam(context, team)).toList());
  }

  Widget _itemTeam(BuildContext context, TeamsModel team) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoute.teamDetailScreen,arguments:team),
      child: GridTile(
        child: Hero(
          tag: team.strAlternate!,
          child: CachedNetworkImage(
            imageUrl: team.strTeamBadge!,
            fit: BoxFit.fitHeight,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text(team.strTeam!),
        ),
      ),
    );
  }

  void searchOperation(String searchText) {


  }
}
