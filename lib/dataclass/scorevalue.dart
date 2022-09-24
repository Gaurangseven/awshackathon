import 'package:flutter/material.dart';

class Scorevalue with ChangeNotifier {

  double _userScore=0.0;

  void setScore(double highscore)
  {
    _userScore=highscore;
    notifyListeners();
  }
  void updatesetScore(double newscore)
  {
    if(_userScore<newscore) {
      _userScore = newscore;
      notifyListeners();
    }
  }
  double get showscore {
    return _userScore;
  }
}
