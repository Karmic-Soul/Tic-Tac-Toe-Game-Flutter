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
                            color: Colors.orange.shade400),
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
                      child: Text('Start a new Game'),
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
    });
  }

  void tapped(int index) {
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

  void checkwinner() {
    //check 1st row//
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        result = 'Player ${displayXO[0]} Wins!';
        updateScore(displayXO[0]);
      });
    }
    //check 2nd row//
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        result = 'Player ${displayXO[3]} Wins!';
        updateScore(displayXO[3]);
      });
    }
    //check 3rd row//
    else if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        result = 'Player ${displayXO[6]} Wins!';
        updateScore(displayXO[6]);
      });
    }
    //check 1st column//
    else if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        result = 'Player ${displayXO[0]} Wins!';
        updateScore(displayXO[0]);
      });
    }
    //check 2nd column//
    else if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        result = 'Player ${displayXO[1]} Wins!';
        updateScore(displayXO[1]);
      });
    }
    //check 3rd column//
    else if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        result = 'Player ${displayXO[2]} Wins!';
        updateScore(displayXO[2]);
      });
    }

    //check diagonal//
    else if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        result = 'Player ${displayXO[0]} Wins!';
        updateScore(displayXO[0]);
      });
    }

    //check diagonal//
    else if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        result = 'Player ${displayXO[2]} Wins!';
        updateScore(displayXO[2]);
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
