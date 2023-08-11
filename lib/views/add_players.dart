import 'package:cric_score/components/mongo_connect.dart';
import 'package:cric_score/models/player_score.dart';
import 'package:cric_score/views/main_score.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

class AddPlayers extends StatefulWidget {
  const AddPlayers({super.key});

  @override
  State<AddPlayers> createState() => _AddPlayersState();
}

class _AddPlayersState extends State<AddPlayers> {
  var Bat1 = TextEditingController();
  var Bat2 = TextEditingController();
  var Bowl = TextEditingController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: Palette.primary,
        title: Text(
          'Add Player',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Striker batsman ',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: Bat1,
              decoration: InputDecoration(
                hintText: 'Players Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.primary),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Non striker batsman',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: Bat2,
              decoration: InputDecoration(
                hintText: 'Players Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.primary),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Bowler',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: Bowl,
              decoration: InputDecoration(
                  hintText: 'Players Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.primary),
                    borderRadius: BorderRadius.circular(4),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                final data1 = PlayerScore(
                    playerName: Bat1.text, playerScore: 0, isOut: false);
                await MongoDB.addPlayer(data1, 'Team_A');
                final data2 = PlayerScore(
                    playerName: Bat2.text, playerScore: 0, isOut: false);
                await MongoDB.addPlayer(data2, 'Team_A');
                final data3 = PlayerScore(
                    playerName: Bowl.text, playerScore: 0, isOut: false);
                await MongoDB.addPlayer(data3, 'Team_B');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainScore(
                            stricker: Bat1.text,
                            non_stricker: Bat2.text,
                            bowler: Bowl.text)));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Palette.primary,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      ' Start Scoring ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
