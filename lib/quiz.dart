import "package:flutter/material.dart";
import "package:quiz_app/start_screen.dart";
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({
    super.key,
  });

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void switchScreen() {
    // This is a function that takes no arguments and returns nothing
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(
        chosenAnswer: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 44, 11, 82),
                Color.fromARGB(255, 38, 8, 58),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

// First time using "if" statements in dart, ? for trune, : for false (idk)
// When you call setState in a State class, Flutter will re-execute the build method and therefor run all the code (up) again and will compare the results of both build methods and if there are changes it will update the UI (bassicly smth like loop I guess?)
// build methods in on line 24 (Widget build(context){} )
// initState is provided by its State class
// We typically want to add initState to our State classes to do some extra initialization work
// super.initState(); shouzld come first before anything other
// The ? tells Dart that the variable may contain a Widget OR null
// build() is called every time a Widget is created
