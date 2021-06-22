import 'package:flutter/material.dart';
import 'main.dart';
import 'package:harry_potter_quiz/main.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function restartQuiz;
  bool _isInterstitialAdLoaded = false;

  @override
  void initState() {
    _loadInterstitialAd();

    FacebookAudienceNetwork.init(
        testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6");
  }

  void _loadInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: "414127989969843_415264529856189",
      listener: (result, value) {
        print(">> FAN > Interstitial Ad: $result --> $value");
        if (result == InterstitialAdResult.LOADED)
          _isInterstitialAdLoaded = true;

        /// Once an Interstitial Ad has been dismissed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _isInterstitialAdLoaded = false;
          _loadInterstitialAd();
        }
      },
    );
  }

  _showInterstitialAd() {
    if (_isInterstitialAdLoaded == true)
      FacebookInterstitialAd.showInterstitialAd();
    else
      print("Interstial Ad not yet loaded!");
  }

  Result(this.resultScore, this.restartQuiz);

  Map<String, Object> get result {
    String text;
    Color textColor;
    Color background;
    Image image;
    if (resultScore >= 60 && resultScore <= 79) {
      text = 'Lord Voldemort \n You are Kind and Honest';
      background = Colors.white;
      textColor = Colors.black;
      image = Image.asset("assets/images/lord.png");
    } else if (resultScore >= 80&& resultScore <= 83) {
      text = 'Severus Snape \n You are Tough.';
      background = Colors.white;
      textColor = Colors.black;
      image = Image.asset("assets/images/snape.png");
    } else if (resultScore >= 84 && resultScore <= 87) {
      text = 'Ronald Weasley \n You are Funny.';
      background = Colors.white;
      textColor = Colors.black;
      image = Image.asset("assets/images/ron.png");
    } else if (resultScore >= 88 && resultScore <= 91) {
      text = 'Ginny Weasley \n You are Pretty and Popular';
      background = Colors.white;
      textColor = Colors.black;
      image = Image.asset("assets/images/ginny.png");
    } else if (resultScore >= 92 && resultScore <= 95) {
      text = 'Hermione Granger \n You are Brave.';
      background = Colors.white;
      textColor = Colors.black;
      image = Image.asset("assets/images/harmoni.png");
    } else if (resultScore >= 96 && resultScore <= 99) {
      text = 'Harry Potter \n You are Brave and Quick Thinker.';
      background = Colors.white;
      textColor = Colors.black;
      image = Image.asset("assets/images/harryy.png");
    } else if (resultScore >= 100 && resultScore <= 103) {
      text = 'Professor McGonagall';
      background = Colors.white;
      textColor = Colors.black;
      image = Image.asset("assets/images/mc.png");
    } else if (resultScore >= 104 && resultScore <= 107) {
      text = 'Rubeus Hagrid';
      background = Colors.white;
      textColor = Colors.black;
      image = Image.asset("assets/images/hag.png");
    } else {
      text = 'Albus Dumbledore';
      background = Colors.white;
      textColor = Colors.black;
      image = Image.asset("assets/images/dam.png");
    }
    return {
      'text': text,
      'textColor': textColor,
      'background': background,
      'image': image
    };
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // alignment: Alignment.center,

        color: result['background'],
        width: double.infinity,
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              result['text'],
              style: TextStyle(
                  fontSize: 36,
                  color: result['textColor'],
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: result['image'],
            ),
            Container(
                margin: EdgeInsets.only(top: 40),
                // margin: EdgeInsets.all(20),
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.white)),
                    child: Text('Come on Again'),
                    color: Colors.yellow,
                    textColor: Colors.black,
                    onPressed: () {
                      restartQuiz();
                      _showInterstitialAd();
                    })),
          ],
        ),
      ),
    );
  }
}
