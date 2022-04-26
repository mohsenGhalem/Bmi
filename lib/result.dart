import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {required this.result,
      required this.isMale,
      required this.age,
      required this.height,
      required this.weight,
      Key? key})
      : super(key: key);

  final double result;
  final double weight;
  final double height;
  final bool isMale;
  final int age;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String get resultPhrase {
    String resultText = "";
    if (widget.result < 18.5) {
      resultText = "UnderWeight";
    } else if (widget.result >= 18.5 && widget.result <= 24.9) {
      resultText = "Normal";
    } else if (widget.result >= 25 && widget.result <= 30) {
      resultText = "Overweight";
    } else {
      resultText = "Obese";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        title: const Text("Result"),
      ),
      body: SafeArea(
        child: Center(
          child: DefaultTextStyle(
            textAlign: TextAlign.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Gender : ${widget.isMale ? "Male" : "Female"}"),
                Text("Age : ${widget.age}"),
                Text("Weight : ${widget.weight} KG"),
                Text("Height : ${widget.height.toStringAsFixed(2)} CM"),
                Text("Result : ${widget.result.toStringAsFixed(2)}"),
                Text("Healthiness : $resultPhrase"),
              ],
            ),
            style: Theme.of(context).textTheme.headline2!,
          ),
        ),
      ),
    );
  }
}
