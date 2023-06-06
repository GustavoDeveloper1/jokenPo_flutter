import 'dart:math';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  var imageApp = AssetImage("assets/images/padrao.png");
  var _mesage = "Escolha uma opção abaixo:";

  void selectedOption(String userChoice) {
    var options = ["pedra", "papel", "tesoura"];
    var number = Random().nextInt(3);
    var appChoice = options[number];

    switch (appChoice) {
      case "pedra":
        setState(() {
          imageApp = const AssetImage("assets/images/pedra.png");
        });
        break;
      case "tesoura":
        setState(() {
          imageApp = const AssetImage("assets/images/tesoura.png");
        });
        break;
      case "papel":
        setState(() {
          imageApp = const AssetImage("assets/images/papel.png");
        });
        break;
    }

    if ((userChoice == "pedra" && appChoice == "tesoura") ||
        (userChoice == "tesoura" && appChoice == "papel") ||
        (userChoice == "papel" && appChoice == "pedra")) {
      setState(() {
        _mesage = "Parabéns, Você ganhou!: 🎆🎉";
      });
    } else if ((userChoice == "tesoura" && appChoice == "pedra") ||
        (userChoice == "papel" && appChoice == "tesoura") ||
        (userChoice == "pedra" && appChoice == "papel")) {
      setState(() {
        _mesage = "Infelimente, Você perdeu! 😞";
      });
    } else {
      setState(() {
        _mesage = "Empatamos";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          Image(
            image: imageApp,
            height: 120,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mesage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () => selectedOption("pedra"),
                  child: Image.asset(
                    "assets/images/pedra.png",
                    height: 100,
                  )),
              GestureDetector(
                  onTap: () => selectedOption("papel"),
                  child: Image.asset(
                    "assets/images/papel.png",
                    height: 100,
                  )),
              GestureDetector(
                onTap: () => selectedOption("tesoura"),
                child: Image.asset(
                  "assets/images/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
