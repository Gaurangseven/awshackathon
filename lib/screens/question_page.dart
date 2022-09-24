import 'dart:async';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:csiq_quiz/dataclass/scorevalue.dart';
import 'package:csiq_quiz/reuseableDatas/constant.dart';
import 'package:csiq_quiz/reuseableDatas/questionmodel.dart';
import 'package:csiq_quiz/screens/result_screen.dart';
import '../dataclass/categorydata.dart';
import '../dataclass/data.dart';

class QuizPage extends StatefulWidget {
  const QuizPage(
      {Key? key,
      required this.catGive,
      required this.difficultyLevel,
      required this.practicelevel})
      : super(key: key);
  final String catGive;
  final int difficultyLevel;
  final int practicelevel;

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final stopwatch = Stopwatch();
  int scoremarks = 0;
  static late int maxseconds;
  late int seconds;
  Timer? timer;
  int totalnoofQuestions = 4;
  Color main = Colors.purple.shade900;
  Color secondColor = const Color(0xffE45826);
  int score = 0;
  int questionI = 0;
  late List<QuestionModel> selectedCategory;
  late int imgno;
  // bool isPressed = false;
  // Color istrue = Colors.green;
  // Color iswrong = Colors.red;

  void updateClock() {
    int holdLevel = widget.difficultyLevel;
    switch (holdLevel) {
      case 1:
        maxseconds = 15;
        seconds = maxseconds;
        break;
      case 2:
        maxseconds = 8;
        seconds = maxseconds;
        break;
      default:
        maxseconds = 5;
        seconds = maxseconds;
        break;
    }
  }

  void changeCategory() {
    stopwatch.start();
    // print(stopwatch.isRunning); //to check wheather the clock is running or not
    String holdData = widget.catGive;
    // print(holdData);
    switch (holdData) {
      case 'Coding':
        selectedCategory = Coding;
        // print(selectedCategory);
        break; // The switch statement must be told to exit, or it will execute every case.
      case 'Network':
        selectedCategory = Network;
        // print(selectedCategory);
        break;
      case 'Hacking':
        selectedCategory = Hacking;
        // print(selectedCategory);
        break;
      case 'Web_Dev':
        selectedCategory = Web_Dev;
        // print(selectedCategory);
        break;
      case 'IT_Tools':
        selectedCategory = IT_Tools;
        // print(selectedCategory);
        break;
      case 'Hardware':
        selectedCategory = Hardware;
        // print(selectedCategory);
        break;
      default:
        selectedCategory = Coding;
      // print('No Category Selected');
    }
  }

  void startclock() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        if (seconds > 0) {
          setState(() {
            seconds--;
          });
        }
      }
      if (seconds == 0 && questionI < 5) {
        zeroUpdateQuestion();
      }
    });
  }

  void zeroUpdateQuestion() {
    if (mounted) {
      setState(() {
        //   print(questionI);
        questionI++;
        //  print(questionI);
      });
      seconds = maxseconds;
      if (questionI == 5) {
        //   print('$questionI I got changed');
        stopwatch.stop();
        scoremarks = stopwatch.elapsedMilliseconds;
        double marksstore = ((score - (0.235 * scoremarks) / 1000) * 2.66) -
            widget.practicelevel * 0.345;

        Provider.of<Scorevalue>(context, listen: false).setScore(marksstore);

        Provider.of<Scorevalue>(context, listen: false)
            .updatesetScore(marksstore);
        if(marksstore>128)
          {
            imgno=1;
          }
        else if(marksstore>107&&marksstore<115)
          {
            imgno=2;
          }
        else if(marksstore<107)
          {
            imgno=3;
          }
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultScreen(scoreGot: score,imageno: imgno)),
        );
      }
    }
  }

  void updateQuestion() {
    if (mounted) {
      setState(() {
        questionI++;
      });
      seconds = maxseconds;
      if (questionI == 5) {
        stopwatch.stop();
        scoremarks = stopwatch.elapsedMilliseconds;
        double marksstore = ((score - (0.235 * scoremarks) / 1000) * 2.66) -
            widget.practicelevel * 0.345;

        Provider.of<Scorevalue>(context, listen: false).setScore(marksstore);

        Provider.of<Scorevalue>(context, listen: false)
            .updatesetScore(marksstore);
        if(marksstore>128)
        {
          imgno=1;
        }
        else if(marksstore>107&&marksstore<115)
        {
          imgno=2;
        }
        else if(marksstore<107)
        {
          imgno=3;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultScreen(scoreGot: score,imageno: imgno,)),
        );
      }
    }
  }

  @override
  void initState() {
    changeCategory();
    stopwatch.start();
    startclock();
    // TODO: implement
    super.initState();
    updateClock();
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // updateClock();
    return Scaffold(
        backgroundColor: const Color(0xff011F3F),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 10),
                child: Text(
                  Provider.of<CategoryData>(context, listen: true).giveCategory,
                  style: ktitle,
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.topCenter,
                fit: StackFit.passthrough,
                children: [
                  Container(
                    height: 155,
                    width: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff132C33),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Stack(
                          alignment: const Alignment(1.6, 1.6),
                          fit: StackFit.passthrough,
                          children: [
                            Center(
                              child: Text(
                                seconds.toString(),
                                style: kmaintitle,
                              ),
                            ),
                            CircularProgressIndicator(
                              value: seconds / maxseconds,
                              backgroundColor: const Color(0xffDA1212),
                              color: const Color(0xff3EC70B),
                              strokeWidth: 10,
                            )
                          ],
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Row(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      '${questionI.toString()}/${totalnoofQuestions.toString()}',
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.orange,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Flexible(
                    child: Container(
                        padding: const EdgeInsets.only(left: 15, right: 5),
                        child: Text(
                          '${selectedCategory[questionI].question}',
                          style: ktestnormal,
                        )),
                  )
                ]),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedCategory[questionI]
                            .answers!
                            .values
                            .toList()[0] ==
                        true) {
                      setState(() {
                        score = score + 10;
                      });
                    }
                    updateQuestion();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 15),
                    width: 305,
                    padding: const EdgeInsets.all(15),
                    decoration: koptionBox,
                    child: Text(
                      selectedCategory[questionI].answers!.keys.toList()[0],
                      style: koption,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedCategory[questionI]
                            .answers!
                            .values
                            .toList()[1] ==
                        true) {
                      setState(() {
                        score = score + 10;
                      });
                    }
                    updateQuestion();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 15),
                    width: 305,
                    padding: const EdgeInsets.all(15),
                    decoration: koptionBox,
                    child: Text(
                      selectedCategory[questionI].answers!.keys.toList()[1],
                      style: koption,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedCategory[questionI]
                            .answers!
                            .values
                            .toList()[2] ==
                        true) {
                      setState(() {
                        score = score + 10;
                      });
                    }

                    updateQuestion();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 15),
                    width: 305,
                    padding: const EdgeInsets.all(15),
                    decoration: koptionBox,
                    child: Text(
                      selectedCategory[questionI].answers!.keys.toList()[2],
                      style: koption,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedCategory[questionI]
                            .answers!
                            .values
                            .toList()[3] ==
                        true) {
                      setState(() {
                        score = score + 10;
                      });
                    }
                    updateQuestion();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 15),
                    width: 305,
                    padding: const EdgeInsets.all(15),
                    decoration: koptionBox,
                    child: Text(
                      selectedCategory[questionI].answers!.keys.toList()[3],
                      style: koption,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // Text(
                //   '$score',
                //   style: kscore,
                // )
              ]),
            ],
          ),
        ));
  }
}

// stopwatch.stop();
// scoremarks = stopwatch.elapsedMilliseconds;
// print(scoremarks);

//
// void zeroUpdateQuestion() {
//   if (mounted) {
//     setState(() {
//       print(questionI);
//       questionI++;
//       print(questionI);
//     });
//     seconds = maxseconds;
//     if (questionI == 5) {
//       print('$questionI I got changed');
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const ResultScreen()),
//       );
//     }
//   }
// }
//
// void updateQuestion() {
//   if (mounted) {
//     setState(() {
//       questionI++;
//     });
//     seconds = maxseconds;
//     if (questionI == 5) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const ResultScreen()),
//       );
//     }
//   }
// }

// child: Text(
//   selectedCategory[questionI].question.toString(),
//   style: ktestnormal,
