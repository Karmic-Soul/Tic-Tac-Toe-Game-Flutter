import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static var customFontWhite = GoogleFonts.oxygen(
    textStyle: const TextStyle(
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
              Expanded(
                child: Center(
                  child: Text(
                    'Score Borad',
                    style: customFontWhite,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        print('click');
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
                            'O',
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
                child: Center(child: Text('Timer', style: customFontWhite)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
