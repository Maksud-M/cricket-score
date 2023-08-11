import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

Matches matchesFromJson(String str) => Matches.fromJson(json.decode(str));

String matchesToJson(Matches data) => json.encode(data.toJson());

class Matches {
  ObjectId? id;
  String teamA;
  String teamB;
  int playersPerTeam;
  int overs;

  Matches({
    this.id,
    required this.teamA,
    required this.teamB,
    required this.playersPerTeam,
    required this.overs,
  });

  factory Matches.fromJson(Map<String, dynamic> json) => Matches(
    id: json["_id"],
    teamA: json["team_a"],
    teamB: json["team_b"],
    playersPerTeam: json["players_per_team"],
    overs: json["overs"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "team_a": teamA,
    "team_b": teamB,
    "players_per_team": playersPerTeam,
    "overs": overs,
  };
}
