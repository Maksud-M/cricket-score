import 'dart:developer';

import 'package:cric_score/models/player_score.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:cric_score/models/matches_model.dart';

class MongoDB {
  static var db;
  static connect() async {
    try {
      db = await Db.create(
          "mongodb+srv://Maksud:Maksud1234@cluster0.rdlotsp.mongodb.net/Score");
      await db.open(secure: true);
      inspect(db);
    } on ConnectionException {
      print("Can't Connect");
    }
  }

  static Future<void> createMatch(Matches data) async {
    try {
      await db.collection('Matches').insertOne(data.toJson());
    } catch (e) {
      return;
    }
  }

  static Future<List<Map<String, dynamic>>?> getMatches() async {
    try {
      final matchData = await db.collection('Matches').find().toList();
      return matchData;
    } catch (e) {
      return null;
    }
  }

  static Future<void> addPlayer(PlayerScore data, String team_name) async {
    try {
      await db.collection(team_name).insertOne(data.toJson());
    } catch (e) {
      return;
    }
  }

  // static Future<void> addPlayersList(ObjectId? id, PlayersScore value) async {
  //   try {
  //     await db
  //         .collection('Score')
  //         .updateOne({"_id": id}, modify.set("playersScore", value));
  //   } catch (e) {
  //     return;
  //   }
  // }
  static Future<void> wicket(String team, String name, int value) async {
    try {
      await db.collection(team).updateOne(
        {"player_name": name},
        modify.set("player_score", value).set("isOut", true),
      );
    } catch (e) {
      return;
    }
  }
}
