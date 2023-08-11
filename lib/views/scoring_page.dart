import 'dart:math';

import 'package:cric_score/views/add_players.dart';
import 'package:cric_score/views/constant.dart';
import 'package:cric_score/views/main_score.dart';
import 'package:flutter/material.dart';

class ScoringPage extends StatefulWidget {
  const ScoringPage({super.key});

  @override
  State<ScoringPage> createState() => _ScoringPageState();
}

class _ScoringPageState extends State<ScoringPage> {
  final random = Random();
  bool isHeads = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Start Scoring',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Color(0xff22c1c3),
              borderRadius: BorderRadius.circular(75),
              border: Border.all(
                color: Colors.deepPurple,
                width: 2,
              ),
            ),
            alignment: isHeads ? Alignment.center : Alignment.center,
            child: isHeads
                ? Text(
                    'Head',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  )
                : Text('Tail',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isHeads = random.nextBool();
              });
            },
            child: Text('Toss Coin'),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddPlayers()));
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Palette.primary,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Start Scoring',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
