import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:football_teams/components/util/alert.dart';
import 'package:football_teams/features/teamList/model/teams_model.dart';
import 'package:url_launcher/url_launcher.dart';


class TeamDetailScreen extends StatefulWidget {
  final TeamsModel? data;

  const TeamDetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<TeamDetailScreen> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends State<TeamDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: content(),
    );
  }

  PreferredSizeWidget appbar() =>
      AppBar(
        title: Text(widget.data!.strTeam.toString()),
      );

  Widget content() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 16, 10, 16),
          child: Column(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: widget.data!.strTeamBanner!,
                fit: BoxFit.fitWidth,
              ),
              _teamDescription(),
              _infoVenue(),
              _infoSocialMedia()
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoVenue() {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Venue',
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Stadium'),
              Text(widget.data!.strStadium!)],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Capacity'),
              Text(widget.data!.intStadiumCapacity!)],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('City'),
              Text(widget.data!.strStadiumLocation!)],
          ),
        ],
      ),
    );
  }

  Widget _teamDescription() {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Information',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold)
          ),
          SizedBox(height: 8),
          ExpandableText(
            widget.data!.strDescriptionEN!,
            expandText: 'show more',
            collapseText: 'show less',
            maxLines: 10,
            expandOnTextTap: true,
            collapseOnTextTap: true,)
        ],
      ),
    );
  }

  Widget _infoSocialMedia() {
    return Container(
      child: Row(
        children: <Widget>[
          IconButton(onPressed: (){
            _launchSocmed(widget.data!.strFacebook!);
          }, icon: FaIcon(FontAwesomeIcons.facebook,size: 32,color: Colors.blueAccent,)),
          IconButton(onPressed: (){
            _launchSocmed(widget.data!.strInstagram!);
          }, icon: const FaIcon(FontAwesomeIcons.instagram,size: 32,)),
          IconButton(onPressed: (){
            _launchSocmed(widget.data!.strTwitter!);
          }, icon: FaIcon(FontAwesomeIcons.twitter,size: 32,color: Colors.blue,)),
        ],
      ),
    );
  }

  _launchSocmed(String url) async{
    String link = 'https://$url';
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch ';
    }
  }
}
