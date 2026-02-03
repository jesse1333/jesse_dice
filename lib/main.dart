// DicePrep.dart

// Barrett Koster
// Your Name Here (replace mine, this is just demos
// of stuff anyone can use).

import "package:flutter/material.dart";
import "dart:math";

void main() // 23
{
  runApp(Yahtzee());
}

class Yahtzee extends StatelessWidget
{
  Yahtzee({super.key});

  @override
  Widget build( BuildContext context )
  { return MaterialApp
    ( title: "yahtzee",
      home: YahtzeeHome(),
    );
  }
}

class YahtzeeHome extends StatefulWidget
{
  @override
  State<YahtzeeHome> createState() => YahtzeeHomeState();
}
    
class YahtzeeHomeState extends State<YahtzeeHome>
{
  final Random _rand = Random();
  int dieValue = 1;

  int rollDie() {
    return _rand.nextInt(6) + 1;
  }

  final positions = {
  "tl": const Offset(25, 25),
  "tc": const Offset(45, 25),
  "tr": const Offset(65, 25),
  "ml": const Offset(25, 45),
  "c":  const Offset(45, 45),
  "mr": const Offset(65, 45),
  "bl": const Offset(25, 65),
  "bc": const Offset(45, 65),
  "br": const Offset(65, 65),
};

  final Map<int, List<String>> diceFaces = {
    1: ["c"],
    2: ["tl", "br"],
    3: ["tl", "c", "br"],
    4: ["tl", "tr", "bl", "br"],
    5: ["tl", "tr", "c", "bl", "br"],
    6: ["tl", "ml", "bl", "tr", "mr", "br"],
  };

  @override
  Widget build( BuildContext context )
  { return Scaffold
    ( appBar: AppBar(title: const Text("yahtzee")),
      body: Column
      ( children:
        [ 
          Container
          ( decoration: BoxDecoration
            ( border: Border.all( width:1, ) ),
            height: 100,
            width: 100,
            child: Stack(
            children: [
              for (var key in diceFaces[dieValue]!)
                Positioned(
                  left: positions[key]!.dx,
                  top: positions[key]!.dy,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          ),

          ElevatedButton(onPressed: () {
            setState(() {
              dieValue = rollDie();
            });
          }, child: const Text("Roll Dice"))
        ]
      ),
    );
  }
}

