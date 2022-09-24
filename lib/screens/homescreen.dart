import 'package:csiq_quiz/screens/dashboard.dart';
import 'package:flutter/material.dart';
import '../reuseableDatas/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1B2F),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/finallogo.png',
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              margin: const EdgeInsets.only(left: 55, right: 55, bottom: 70),
              child: const Text(
                  '“The computer was born to solve problems that did not exist before.”'
                  ' — Bill Gates, Microsoft founder',
                  style: kquote),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashboard()),
                );
              },
              child: Container(
                height: 3.0,
                width: 155.0,
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      'I m Afraid',
                      style: kfancy,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Color(0xffF7BE16),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(55),
                    bottomLeft: Radius.circular(55),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
