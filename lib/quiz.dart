import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';

import './questions.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  final player = AudioCache();

  AudioPlayer audioPlayer = AudioPlayer();
  Quiz({
    @required this.answerQuestion,
    @required this.questions,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Question(questions[questionIndex]['questionText']),
          ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
              .map(
                (answer) => Answer(
                  answer['text'],
                  () => answerQuestion(answer['score']),
                ),
              )
              .toList(),
          Container(
            margin: EdgeInsets.only(top: 50),
          ),
          RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(color: Colors.white)),
              child: Text(
                '  Turn on Music\n1 click is enough!',
                style: TextStyle(fontSize: 16),
              ),
              color: Colors.yellow,
              textColor: Colors.red,
              onPressed: () {
                player.play("harry.mp3");
              }),
        ],
      ),
    );
  }
}
