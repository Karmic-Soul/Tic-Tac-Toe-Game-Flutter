import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String result = '';
  bool oTurn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  bool winnerFound = false;
  List<int> matchedIndexes = [];
  static var customFontWhite = GoogleFonts.oxygen(
    textStyle: const TextStyle(
      color: Colors.white,
      letterSpacing: 5,
      fontSize: 26,
    ),
  );
  static var customStyle = GoogleFonts.oxygen(
    textStyle: const TextStyle(
      decoration: TextDecoration.underline,
      color: Colors.white,
      letterSpacing: 5,
      fontSize: 26,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // ScoreBoard
              Expanded(
                  child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('PLAYER O', style: customStyle),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          oScore.toString(),
                          style: customFontWhite,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          'PLAYER X',
                          style: customStyle,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          xScore.toString(),
                          style: customFontWhite,
                        ),
                      ],
                    ),
                  ],
                ),
              )),

              // GameBoard
              Expanded(
                flex: 3,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 5,
                              color: Colors.deepPurple,
                            ),
                            color: matchedIndexes.contains(index)
                                ? Colors.blueAccent
                                : Colors.orange.shade400),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: GoogleFonts.lilitaOne(
                                textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 70,
                            )),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        reset();
                      },
                      child: Text('Reset Board'),
                    ),
                    Text(
                      result,
                      style: customFontWhite,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        newGame();
                      },
                      child: Text('START A NEW GAME'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void newGame() {
    reset();
    oScore = 0;
    xScore = 0;
  }

  void reset() {
    setState(() {
      displayXO = ['', '', '', '', '', '', '', '', ''];
      result = '';
      filledBoxes = 0;
      winnerFound = false;
      matchedIndexes = [];
    });
  }

  void tapped(int index) {
    if (winnerFound == false) {
      setState(() {
        if (oTurn && displayXO[index] == '') {
          displayXO[index] = 'O';
          filledBoxes++;
        } else if (displayXO[index] == '') {
          displayXO[index] = 'X';
          filledBoxes++;
        }
        oTurn = !oTurn;
        checkwinner();
      });
    }
  }

  void checkwinner() {
    //check 1st row//
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        result = 'Player ${displayXO[0]} Wins!';
        winnerFound = true;
        updateScore(displayXO[0]);
        matchedIndexes.addAll([0, 1, 2]);
      });
    }
    //check 2nd row//
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        result = 'Player ${displayXO[3]} Wins!';
        winnerFound = true;
        updateScore(displayXO[3]);
        matchedIndexes.addAll([3, 4, 5]);
      });
    }
    //check 3rd row//
    else if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        result = 'Player ${displayXO[6]} Wins!';
        winnerFound = true;
        updateScore(displayXO[6]);
        matchedIndexes.addAll([6, 7, 8]);
      });
    }
    //check 1st column//
    else if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        result = 'Player ${displayXO[0]} Wins!';
        winnerFound = true;
        updateScore(displayXO[0]);
        matchedIndexes.addAll([0, 3, 6]);
      });
    }
    //check 2nd column//
    else if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        result = 'Player ${displayXO[1]} Wins!';
        winnerFound = true;
        updateScore(displayXO[1]);
        matchedIndexes.addAll([1, 4, 7]);
      });
    }
    //check 3rd column//
    else if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        result = 'Player ${displayXO[2]} Wins!';
        winnerFound = true;
        updateScore(displayXO[2]);
        matchedIndexes.addAll([2, 5, 8]);
      });
    }

    //check diagonal//
    else if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        result = 'Player ${displayXO[0]} Wins!';
        winnerFound = true;
        updateScore(displayXO[0]);
        matchedIndexes.addAll([0, 4, 8]);
      });
    }

    //check diagonal//
    else if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        result = 'Player ${displayXO[2]} Wins!';
        winnerFound = true;
        updateScore(displayXO[2]);
        matchedIndexes.addAll([2, 4, 6]);
      });
    } else if (filledBoxes == 9) {
      setState(() {
        result = 'Match tied !';
      });
    }
  }

  void updateScore(String winner) {
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    } else {
      return;
    }
  }
}
