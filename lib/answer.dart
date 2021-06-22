import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String _answerText;
  final Function selectHandler;

  Answer(this._answerText, this.selectHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.black)),
        color: Colors.yellow,
        textColor: Colors.black,
        child: Text(_answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
