// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_start_up_animation/animation/flutter_start_up_animation.dart';

import 'my_card/my_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Start Up Animation"),
      ),
      body: StartUpAnimation(
        animationDuration: 2,
        children: [
          MyCard(
            text: "Card 1",
          ),
          MyCard(
            text: "Card 2",
          ),
          MyCard(
            text: "Card 3",
          ),
          MyCard(
            text: "Card 4",
          ),
          MyCard(
            text: "Card 5",
          ),
          MyCard(
            text: "Card 6",
          ),
        ],
        crossAxisCount: 2,
      ),
    );
  }
}


// Good Bye 