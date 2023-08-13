import 'package:cric_score/models/matches_model.dart';
import 'package:cric_score/views/add_player.dart';
import 'package:cric_score/views/constant.dart';
import 'package:cric_score/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cric_score/components/mongo_connect.dart';
import 'package:cric_score/models/matches_model.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  var teamA = TextEditingController();
  var teamB = TextEditingController();
  var numberOfPlayers = TextEditingController();
  var overs = TextEditingController();
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
          'Teams',
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
              'Team A',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: teamA,
              decoration: InputDecoration(
                hintText: 'Team A name',
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
              'Team B',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: teamB,
              decoration: InputDecoration(
                hintText: 'Team B name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.primary),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Players per team',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: numberOfPlayers,
              decoration: InputDecoration(
                hintText: '7, 9, 11, etc...',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.primary),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Overs',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: overs,
              decoration: InputDecoration(
                  hintText: '5,10,15,20,etc...',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.primary),
                    borderRadius: BorderRadius.circular(4),
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () async {
                await _insertMatch(teamA.text, teamB.text,
                    int.parse(numberOfPlayers.text), int.parse(overs.text));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Palette.primary,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Save',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
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

  Future<void> _insertMatch(
      String teamA, String teamB, int numberOfPlayers, int overs) async {
    final data = Matches(
        teamA: teamA,
        teamB: teamB,
        playersPerTeam: numberOfPlayers,
        overs: overs);
    await MongoDB.createMatch(data);
    print("data added");
  }
}
