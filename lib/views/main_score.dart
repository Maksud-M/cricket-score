import 'package:cric_score/components/mongo_connect.dart';
import 'package:cric_score/models/player_score.dart';
import 'package:cric_score/views/constant.dart';
import 'package:flutter/material.dart';

class MainScore extends StatefulWidget {
  final String stricker, non_stricker, bowler;
  const MainScore(
      {super.key,
      required this.stricker,
      required this.non_stricker,
      required this.bowler});

  @override
  State<MainScore> createState() => _MainScoreState();
}

class _MainScoreState extends State<MainScore> {
  int stricker_run = 0;
  int non_stricker_run = 0;
  int total_run = 0;
  int out = 0;
  String stric = "";
  String non_stric = "";
  String bowl = "";
  bool isStricker = true;
  List<int> balls = [];
  @override
  void initState() {
    super.initState();
    stric = widget.stricker;
    non_stric = widget.non_stricker;
    bowl = widget.bowler;
  }

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
          'Score Board',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Run/Wicket',
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade600),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '$total_run/$out',
                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade900),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Batsman',
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.44,
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Visibility(
                                    visible: isStricker,
                                    child: Text(
                                      '*',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey.shade900),
                                    ),
                                  ),
                                  Text(
                                    '${stric}:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                '$stricker_run',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey.shade900),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () async {
                              var Ball = TextEditingController();
                              Dialog optionDialog = Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        8.0)), //this right here
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  height: 240.0,
                                  width: 300.0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextFormField(
                                          controller: Ball,
                                          decoration: InputDecoration(
                                            hintText: 'Extra Run',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.primary),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            setState(() {
                                              stricker_run +=
                                                  int.parse(Ball.text);
                                              total_run +=
                                                  int.parse(Ball.text) + 1;
                                            });

                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: Palette.primary,
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12),
                                                child: Text(
                                                  'Add',
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
                                ),
                              );
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      optionDialog);
                            },
                            child: Icon(Icons.add)),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.44,
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Visibility(
                                    visible: !isStricker,
                                    child: Text(
                                      '*',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey.shade900),
                                    ),
                                  ),
                                  Text(
                                    '${non_stric}:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                '${non_stricker_run}',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey.shade900),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () async {
                              var Ball = TextEditingController();
                              Dialog optionDialog = Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        8.0)), //this right here
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  height: 240.0,
                                  width: 300.0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextFormField(
                                          controller: Ball,
                                          decoration: InputDecoration(
                                            hintText: 'Extra Run',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.primary),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            setState(() {
                                              non_stricker_run +=
                                                  int.parse(Ball.text);
                                              total_run +=
                                                  int.parse(Ball.text) + 1;
                                            });

                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: Palette.primary,
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12),
                                                child: Text(
                                                  'Add',
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
                                ),
                              );
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      optionDialog);
                            },
                            child: Icon(Icons.add)),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          'Bowler',
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${bowl}:',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade600),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            SizedBox(
                              height: 30,
                              width: MediaQuery.of(context).size.width * 0.44,
                              child: (balls.length > 0)
                                  ? ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: balls.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Text(
                                          '${balls[index]}  ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey.shade900),
                                        );
                                      })
                                  : SizedBox(),
                            ),
                          ],
                        ),
                        GestureDetector(
                            onTap: () {
                              Dialog optionDialog = Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        8.0)), //this right here
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  height: 300.0,
                                  width: 300.0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (isStricker) {
                                                      stricker_run += 1;
                                                    } else {
                                                      non_stricker_run += 1;
                                                    }
                                                    balls.add(1);
                                                    total_run += 1;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: 57,
                                                  width: 57,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                      color: Palette.primary,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      child: Text(
                                                        '1',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Palette.primary,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (isStricker) {
                                                      stricker_run += 2;
                                                    } else {
                                                      non_stricker_run += 2;
                                                    }
                                                    balls.add(2);
                                                    total_run += 2;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: 57,
                                                  width: 57,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                      color: Palette.primary,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      child: Text(
                                                        '2',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Palette.primary,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (isStricker) {
                                                      stricker_run += 4;
                                                    } else {
                                                      non_stricker_run += 4;
                                                    }
                                                    balls.add(4);
                                                    total_run += 4;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: 57,
                                                  width: 57,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                      color: Palette.primary,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      child: Text(
                                                        '4',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Palette.primary,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (isStricker) {
                                                      stricker_run += 6;
                                                    } else {
                                                      non_stricker_run += 6;
                                                    }
                                                    balls.add(6);
                                                    total_run += 6;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: 57,
                                                  width: 57,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                      color: Palette.primary,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      child: Text(
                                                        '6',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Palette.primary,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  balls.add(0);
                                                  total_run += 0;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: 57,
                                                width: 57,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: Palette.primary,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    child: Text(
                                                      '0',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Palette.primary,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  total_run += 1;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: 57,
                                                width: 57,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: Palette.primary,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    child: Text(
                                                      'Wd',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Palette.primary,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      optionDialog);
                            },
                            child: Icon(Icons.add)),
                        GestureDetector(
                          onTap: () async {
                            out += 1;
                            balls.add(0);
                            await MongoDB.wicket(
                                'Team_A',
                                (isStricker) ? stric : non_stric,
                                (isStricker) ? stricker_run : non_stricker_run);

                            var Bat1 = TextEditingController();
                            Dialog optionDialog = Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8.0)), //this right here
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                height: 240.0,
                                width: 300.0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextFormField(
                                        controller: Bat1,
                                        decoration: InputDecoration(
                                          hintText: 'Players Name',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Palette.primary),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          if (isStricker) {
                                            setState(() {
                                              stric = Bat1.text;
                                              stricker_run = 0;
                                            });
                                          } else {
                                            setState(() {
                                              non_stric = Bat1.text;
                                              non_stricker_run = 0;
                                            });
                                          }
                                          final data1 = PlayerScore(
                                              playerName: Bat1.text,
                                              playerScore: 0,
                                              isOut: false);
                                          await MongoDB.addPlayer(
                                              data1, 'Team_A');
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Palette.primary,
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12),
                                              child: Text(
                                                'Set',
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
                              ),
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    optionDialog);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Palette.primary,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Text(
                                'W',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isStricker = !isStricker;
                });
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
                      'Swap Batsman',
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
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () async {
                var Ball = TextEditingController();
                Dialog optionDialog = Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0)), //this right here
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    height: 240.0,
                    width: 300.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: Ball,
                            decoration: InputDecoration(
                              hintText: 'Bowler Name',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Palette.primary),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () async {
                              setState(() {
                                balls.clear();
                                bowl = Ball.text;
                              });
                              final data1 = PlayerScore(
                                  playerName: Ball.text,
                                  playerScore: 0,
                                  isOut: false);
                              await MongoDB.addPlayer(data1, 'Team_B');
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Palette.primary,
                              ),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    'Set',
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
                  ),
                );
                showDialog(
                    context: context,
                    builder: (BuildContext context) => optionDialog);
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
                      'Next Bowler',
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
