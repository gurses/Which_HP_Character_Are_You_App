import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  bool _isInterstitialAdLoaded = false;

  Widget _currentAd = SizedBox(
    width: 0.0,
    height: 0.0,
  );


  _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
      _totalScore += score;
    });
    print(_questionIndex);
  }

  _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'questionText': "What's the first thing people notice about you?",
        'answers': [
          {
            'text': 'The bit of pizza stuck to your cheek',
            'score': 12,
            'buttonColor': Colors.blue
          },
          {
            'text': 'Your pile of spell books',
            'score': 13,
            'buttonColor': Colors.green
          },
          {
            'text': "You're a bit evil'",
            'score': 14,
            'buttonColor': Colors.purple
          },
          {
            'text': "You're a bit shifty",
            'score': 15,
            'buttonColor': Colors.red
          },
          {'text': "None", 'score': 10, 'buttonColor': Colors.red},
        ]
      },
      {
        'questionText': "Which Pet Would You Like To Keep?",
        'answers': [
          {'text': 'Cat', 'score': 10, 'buttonColor': Colors.blue},
          {'text': 'Owl', 'score': 15, 'buttonColor': Colors.green},
          {
            'text': "Either a Rat or a Toad'",
            'score': 12,
            'buttonColor': Colors.purple
          },
          {'text': "Pygmy Puff", 'score': 14, 'buttonColor': Colors.red},
          {'text': "Any Of The Above", 'score': 16, 'buttonColor': Colors.red},
        ]
      },
      {
        'questionText': "How Would Your Friends Describe You?",
        'answers': [
          {'text': 'A Leader', 'score': 16, 'buttonColor': Colors.blue},
          {
            'text': 'Sarcastic and Funny',
            'score': 10,
            'buttonColor': Colors.green
          },
          {
            'text': "Smart and Talented",
            'score': 10,
            'buttonColor': Colors.purple
          },
          {'text': "Eccentric", 'score': 11, 'buttonColor': Colors.red},
          {'text': "Self Confident", 'score': 12, 'buttonColor': Colors.red},
        ]
      },
      {
        'questionText': "When Planning a Trip, You are the One Who?",
        'answers': [
          {
            'text': 'Finds the hot parties',
            'score': 13,
            'buttonColor': Colors.blue
          },
          {
            'text': 'Works out all the details',
            'score': 10,
            'buttonColor': Colors.green
          },
          {
            'text': "Keeps everyone under control'",
            'score': 8,
            'buttonColor': Colors.purple
          },
          {
            'text': "Tries to help the others whenever possible",
            'score': 15,
            'buttonColor': Colors.red
          },
          {'text': "None", 'score': 10, 'buttonColor': Colors.red},
        ]
      },
      {
        'questionText': "Which of the Following are You Most Afraid of?",
        'answers': [
          {
            'text': 'Losing the people I love',
            'score': 13,
            'buttonColor': Colors.blue
          },
          {
            'text': 'Not being accepted',
            'score': 9,
            'buttonColor': Colors.green
          },
          {
            'text': "Losing... anything",
            'score': 14,
            'buttonColor': Colors.purple
          },
          {
            'text': "Leading an unfulfilling life",
            'score':7,
            'buttonColor': Colors.red
          },
          {'text': "None", 'score': 10, 'buttonColor': Colors.red},
        ]
      },
      {
        'questionText': "What was Your Favorite Toy as a Kid?",
        'answers': [
          {
            'text': 'Barbie-had a good collection with plenty of add-ons',
            'score': 7,
            'buttonColor': Colors.blue
          },
          {
            'text': 'Remote control car and video games',
            'score': 4,
            'buttonColor': Colors.green
          },
          {
            'text': "Tea set with complete matching doll set of course",
            'score': 16,
            'buttonColor': Colors.purple
          },
          {'text': "No toys", 'score': 10, 'buttonColor': Colors.red},
          {'text': "None", 'score': 5, 'buttonColor': Colors.red},
        ]
      },
      {
        'questionText': "What is Your Favourite Subject?",
        'answers': [
          {'text': 'Potions', 'score': 18, 'buttonColor': Colors.blue},
          {
            'text': 'Defense Against Dark Arts',
            'score': 6,
            'buttonColor': Colors.green
          },
          {'text': "Charms", 'score': 11, 'buttonColor': Colors.purple},
          {'text': "All", 'score': 14, 'buttonColor': Colors.red},
          {'text': "None", 'score': 8, 'buttonColor': Colors.red},
        ]
      },
      {
        'questionText': "What Kind of People Do You Like Most?",
        'answers': [
          {
            'text': 'People Who are Like Me',
            'score': 18,
            'buttonColor': Colors.blue
          },
          {
            'text': 'People Who are Like Smart',
            'score': 7,
            'buttonColor': Colors.green
          },
          {
            'text': "People Who are Like Brave",
            'score': 10,
            'buttonColor': Colors.purple
          },
          {
            'text': "People Who are Like Funny",
            'score': 4,
            'buttonColor': Colors.red
          },
          {
            'text': "People Who are Like Unique",
            'score': 1,
            'buttonColor': Colors.red
          },
        ]
      },
      {
        'questionText': "Who is Your Crush?",
        'answers': [
          {'text': 'Harry Potter', 'score': 7, 'buttonColor': Colors.blue},
          {
            'text': 'Ginny Weasley or Ron Weasley',
            'score': 10,
            'buttonColor': Colors.green
          },
          {
            'text': "Hermione Granger",
            'score': 3,
            'buttonColor': Colors.purple
          },
          {'text': "Luna LoveGood", 'score': 8, 'buttonColor': Colors.red},
          {
            'text': "Neville Longbottom",
            'score': 6,
            'buttonColor': Colors.red
          },
        ]
      },
    ];

    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.yellow),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Column(
              children: <Widget>[
                Text(
                  'Which Harry P. Character are You?',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  'Find Out Who You Are',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          body: Center(
            child: Column(children: <Widget>[
              _questionIndex < _questions.length
                  ? Quiz(
                      answerQuestion: _answerQuestion,
                      questionIndex: _questionIndex,
                      questions: _questions,
                    )
                  : Result(_totalScore, _restartQuiz),
              Flexible(
                child: Align(
                  alignment: Alignment(0, 1),
                  child: _currentAd,
                ),
                fit: FlexFit.tight,
                flex: 2,
              ),
            ]),
          ),
        ));
  }
}
