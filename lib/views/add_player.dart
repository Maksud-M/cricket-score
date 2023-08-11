import 'package:cric_score/views/constant.dart';
import 'package:cric_score/views/home_screen.dart';
import 'package:flutter/material.dart';

class AddPlayers extends StatefulWidget {
  const AddPlayers({super.key});

  @override
  State<AddPlayers> createState() => _AddPlayersState();
}

class _AddPlayersState extends State<AddPlayers> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              if (index == 1) {
                setState(() {
                  index--;
                });
              } else {
                Navigator.pop(context);
              }
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
        actions: [
          IconButton(
              onPressed: () {
                if (index == 0) {
                  setState(() {
                    index++;
                  });
                } else {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }
              },
              icon: Icon(
                Icons.next_plan,
                color: Colors.white,
              )),
        ],
      ),
      body: (index == 0)
          ? Team(
              teamName: 'Team A',
            )
          : Team(teamName: 'Team B'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.primary,
        onPressed: () {
          Dialog playerDialog = Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)), //this right here
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              height: 300.0,
              width: 300.0,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Players Name',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        hintText: 'Enter Player Name',
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
                      'Players Role',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        hintText: 'Batsman or Bowler',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Palette.primary),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Palette.primary,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Add',
                              style: TextStyle(
                                  fontSize: 16,
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
            ),
          );
          showDialog(
              context: context,
              builder: (BuildContext context) => playerDialog);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class Team extends StatelessWidget {
  final String teamName;
  const Team({
    super.key,
    required this.teamName,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              '$teamName Players',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 11,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Player Name:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Maksudur Rahman',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Player Role:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Batsman',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
