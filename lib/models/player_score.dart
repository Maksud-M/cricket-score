// To parse this JSON data, do
//
//     final playerScore = playerScoreFromJson(jsonString);

import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

PlayerScore playerScoreFromJson(String str) =>
    PlayerScore.fromJson(json.decode(str));

String playerScoreToJson(PlayerScore data) => json.encode(data.toJson());

class PlayerScore {
  ObjectId? id;
  String playerName;
  int playerScore;
  bool isOut;

  PlayerScore({
    this.id,
    required this.playerName,
    required this.playerScore,
    required this.isOut,
  });

  factory PlayerScore.fromJson(Map<String, dynamic> json) => PlayerScore(
        id: json["_id"],
        playerName: json["player_name"],
        playerScore: json["player_score"],
        isOut: json["isOut"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "player_name": playerName,
        "player_score": playerScore,
        "isOut": isOut,
      };
}
