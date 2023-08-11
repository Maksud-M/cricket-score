// To parse this JSON data, do
//
//     final viewMatch = viewMatchFromJson(jsonString);

import 'dart:convert';

ViewMatch viewMatchFromJson(String str) => ViewMatch.fromJson(json.decode(str));

String viewMatchToJson(ViewMatch data) => json.encode(data.toJson());

class ViewMatch {
  String teamA;
  String teamB;
  int playersPerTeam;
  int overs;

  ViewMatch({
    required this.teamA,
    required this.teamB,
    required this.playersPerTeam,
    required this.overs,
  });

  factory ViewMatch.fromJson(Map<String, dynamic> json) => ViewMatch(
    teamA: json["team_a"],
    teamB: json["team_b"],
    playersPerTeam: json["players_per_team"],
    overs: json["overs"],
  );

  Map<String, dynamic> toJson() => {
    "team_a": teamA,
    "team_b": teamB,
    "players_per_team": playersPerTeam,
    "overs": overs,
  };
}
