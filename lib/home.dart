import 'dart:math';

import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double height = 90;
  int age = 18;
  double weight = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white12,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0.05,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  //Male
                  InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: isMale ? Colors.cyan : Colors.teal,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.male,
                            size: 90,
                          ),
                          Text(
                            "Male",
                            style: Theme.of(context).textTheme.headline2,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  //Female
                  InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: !isMale ? Colors.cyan : Colors.teal,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.female, size: 90),
                          Text(
                            "Female",
                            style: Theme.of(context).textTheme.headline2,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.teal,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Slider(
                        max: 220,
                        min: 90,
                        label: "$height CM",
                        activeColor: Colors.amberAccent,
                        inactiveColor: Colors.white,
                        value: height,
                        onChanged: (newValue) {
                          setState(() {
                            height = newValue;
                          });
                        }),
                    Text(
                      "${height.toStringAsFixed(0)} cm",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  //Weight
                  Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.teal,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "${weight.toStringAsFixed(1)} KG",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                if (weight > 0) {
                                  setState(() {
                                    weight--;
                                  });
                                }
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 30,
                              ),
                              backgroundColor: Colors.cyan,
                            ),
                            const SizedBox(width: 15.0),
                            FloatingActionButton(
                              backgroundColor: Colors.cyan,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                size: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  //Age
                  Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.teal,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "$age",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                if (age > 18) {
                                  setState(() {
                                    age--;
                                  });
                                }
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 30,
                              ),
                              backgroundColor: Colors.cyan,
                            ),
                            const SizedBox(width: 15.0),
                            FloatingActionButton(
                              backgroundColor: Colors.cyan,
                              onPressed: () {
                                if (age <= 65) {
                                  setState(() {
                                    age++;
                                  });
                                }
                              },
                              child: const Icon(
                                Icons.add,
                                size: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              //Button
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    double h = height/100;
                    double result = weight/pow(h,2);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => ResultScreen(
                            result: result,
                            isMale: isMale,
                            age: age,
                            height: height,
                            weight: weight)));
                  },
                  child: const Text("View result"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
