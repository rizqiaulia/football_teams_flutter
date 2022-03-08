class TeamsModel {
  String? strAlternate;
  String? intFormedYear;
  String? strStadium;
  String? strDescriptionEN;
  String? intStadiumCapacity;
  String? strWebsite;
  String? strFacebook;
  String? strTwitter;
  String? strInstagram;
  String? strTeamLogo;
  String? strTeamBadge;
  String? strTeam;
  String? strTeamBanner;
  String? strStadiumLocation;

  TeamsModel(this.strAlternate, this.intFormedYear, this.strStadium,
      this.strDescriptionEN, this.intStadiumCapacity, this.strWebsite,
      this.strFacebook, this.strTwitter, this.strInstagram,this.strTeamLogo,this.strTeamBadge,this.strTeam,this.strTeamBanner,this.strStadiumLocation);

  TeamsModel.fromJson(Map<String, dynamic> json) {
    strAlternate = json['strAlternate'];
    intFormedYear = json['intFormedYear'];
    strStadium = json['strStadium'];
    strDescriptionEN = json['strDescriptionEN'];
    intStadiumCapacity = json['intStadiumCapacity'];
    strWebsite = json['strWebsite'];
    strFacebook = json['strFacebook'];
    strTwitter = json['strTwitter'];
    strInstagram = json['strInstagram'];
    strTeamLogo = json['strTeamLogo'];
    strTeamBadge = json['strTeamBadge'];
    strTeam = json['strTeam'];
    strTeamBanner = json['strTeamBanner'];
    strStadiumLocation = json['strStadiumLocation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strAlternate'] = strAlternate;
    data['intFormedYear'] = intFormedYear;
    data['strStadium'] = strStadium;
    data['strDescriptionEN'] = strDescriptionEN;
    data['intStadiumCapacity'] = intStadiumCapacity;
    data['strWebsite'] = strWebsite;
    data['strFacebook'] = strFacebook;
    data['strTwitter'] = strTwitter;
    data['strInstagram'] = strInstagram;
    data['strTeamLogo'] = strTeamLogo;
    data['strTeamBadge'] = strTeamBadge;
    data['strTeam'] = strTeam;
    data['strTeamBanner'] = strTeamBanner;
    data['strStadiumLocation'] = strStadiumLocation;
    return data;
  }
}