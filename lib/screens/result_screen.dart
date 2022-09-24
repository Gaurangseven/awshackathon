// import 'dart:html';
import 'package:csiq_quiz/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:csiq_quiz/dataclass/scorevalue.dart';
import 'package:csiq_quiz/screens/Inputpage.dart';
import '../reuseableDatas/constant.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.scoreGot,
    required this.imageno,
  }) : super(key: key);

  final int scoreGot;
  final int imageno;
  // final double percentileScore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        // leading: const Icon(Icons.home),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Fierce Tech',
              style: kmaintitle,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/finallogo.png',
                  height: 80,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xff0F044C),
      ),
      backgroundColor: const Color(0xff141E61),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: const Text(
              'Quiz Result',
              style: kresulttiles,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Image.asset('assets/$imageno.png',
              height: 200, width: 175, fit: BoxFit.fitWidth),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Score: ',
                style: kresulttiles,
              ),
              Text(
                scoreGot.toString(),
                style: kscore,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Percentile :',
                style: kresulttiles,
              ),
              Text(
                Provider.of<Scorevalue>(context, listen: false)
                    .showscore
                    .toStringAsFixed(2),
                style: kscore,
              )
            ],
          ),
          const SizedBox(
            height: 105,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff000B49), Color(0xff371B58)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(75),
                      topLeft: Radius.circular(75))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      elevation: 1500,
                      fixedSize: const Size(150, 70),
                      backgroundColor: const Color(0xff00B4D8),
                      padding: const EdgeInsets.all(5.0),
                      textStyle: kbuttontext,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Share your Score',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      elevation: 1500,
                      fixedSize: const Size(150, 70),
                      backgroundColor: const Color(0xffF0A500),
                      padding: const EdgeInsets.all(5.0),
                      textStyle: kbuttontext,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InputPage()),
                      );
                    },
                    child: const Text(
                      'Take a new Quiz',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
