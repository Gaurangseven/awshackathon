import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:csiq_quiz/screens/category_page.dart';
import '../reuseableDatas/card_content.dart';
import '../dataclass/categorydata.dart';
import '../reuseableDatas/reuseableCard.dart';
import '../reuseableDatas/constant.dart';
import 'category_page.dart';
import 'question_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

enum PeopleCategory { noONE, student, professional }

enum QuizCategory { noONE, random, category }

enum Quiztopic {
  none,
  coding,
  cybersecurity,
  network,
  webD,
  basictools,
  hardware
}

PeopleCategory selectedCategory = PeopleCategory.noONE;
QuizCategory selectedquiz = QuizCategory.noONE;
Quiztopic selectedtopic = Quiztopic.none;
int studentelite = 0;

class _InputPageState extends State<InputPage> {
  int level = 1;
  String changebleimage = 'graduate';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1B2F),
      appBar: AppBar(
        //toolbarHeight: 70,
        automaticallyImplyLeading: false,
           title:  Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               const Text(
                 'Fierce Tech',
                 style: kmaintitle,
               ),
               Hero(
                 tag: 'logo',
                 child: Image.asset(
                   'assets/finallogo.png',
                   height: 80,
                 ),
               ),
             ],
           ),
        elevation: 10,
        backgroundColor: const Color(0xff1b1b2f),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (mounted) {
                          setState(() {
                            selectedCategory = PeopleCategory.student;
                            studentelite = 1;
                          });
                        }
                      },
                      child: ReuseableCard(
                          colour: selectedCategory == PeopleCategory.student
                              ? activeCard
                              : inactiveCard,
                          childcard: const CardContent(
                              label: 'STUDENT', image: 'student')),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (mounted) {
                          setState(() {
                            selectedCategory = PeopleCategory.professional;
                            studentelite = 2;
                          });
                        }
                      },
                      child: ReuseableCard(
                          colour:
                              selectedCategory == PeopleCategory.professional
                                  ? activeCard
                                  : inactiveCard,
                          childcard: const CardContent(
                              label: 'ELITE', image: 'hacker')),
                    ),
                  ),
                ],
              ) // Student and Elite Boxes
              ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              colour: inactiveCard,
              childcard: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Text(
                    'Level',
                    style: ktitle,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFF17B978),
                      overlayColor: const Color(0x29A7FF83),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                      value: level.toDouble(),
                      min: 1,
                      max: 3,
                      activeColor: const Color(0xffF0A500),
                      inactiveColor: const Color(0xff27496D),
                      onChanged: (double newValue) {
                        if (mounted) {
                          setState(() {
                            level = newValue.round();
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    level == 1
                        ? 'Noob'
                        : level == 2
                            ? 'Medium'
                            : 'Genius',
                    style: ktitle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        selectedquiz = QuizCategory.random;
                      });
                    }
                  },
                  child: ReuseableCard(
                      colour: selectedquiz == QuizCategory.random
                          ? activeCard
                          : inactiveCard,
                      childcard:
                          const CardContent(label: 'RANDOM', image: 'dices')),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const CategoryPage();
                      }),
                    );
                    if (mounted) {
                      setState(() {
                        selectedquiz = QuizCategory.category;
                      });
                    }
                  },
                  child: ReuseableCard(
                    colour: selectedquiz == QuizCategory.category
                        ? activeCard
                        : inactiveCard,
                    childcard: CardContent(
                        label: Provider.of<CategoryData>(context, listen: true)
                            .giveCategory,
                        image: Provider.of<CategoryData>(context, listen: true)
                            .giveCategory),
                  ),
                  //Provider.of<CategoryData>(context, listen: true ).giveCategory
                )),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                String selectedCAT =
                    Provider.of<CategoryData>(context, listen: false)
                        .giveCategory;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return QuizPage(
                      catGive: selectedCAT,
                      difficultyLevel: level,
                      practicelevel: studentelite,
                    );
                  }),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 6),
                height: 15.0,
                width: 175.0,
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      'Start',
                      style: kfancy,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffFFC900),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ), //Quiz start Button
        ],
      ),
    );
  }
}
