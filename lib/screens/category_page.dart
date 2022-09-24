import 'package:flutter/material.dart';
import 'package:csiq_quiz/dataclass/scorevalue.dart';
import '../reuseableDatas/constant.dart';
import '../reuseableDatas/card_content.dart';
import '../dataclass/categorydata.dart';
import '../reuseableDatas/reuseableCard.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String category = 'Select a Category ';
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categorys',
                style: kmaintitle,
              ),
              Text(
                Provider.of<Scorevalue>(context, listen: true)
                    .showscore
                    .toStringAsFixed(2),
                style: ktitle,
              )
            ],
          ),
          //
          backgroundColor: const Color(0xff041C32),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                category,
                style: kcatetitle,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    onCategory: () {
                      category = 'Coding';
                      Provider.of<CategoryData>(context, listen: false)
                          .chooseCategory(category);
                      Navigator.pop(context);
                    },
                    colour: inactiveCard,
                    childcard:
                        const CardContent(label: 'Coding', image: 'Coding'),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                      onCategory: () {
                        if (Provider.of<Scorevalue>(context, listen: false)
                                .showscore >
                            95) {
                          category = 'Network';
                          Provider.of<CategoryData>(context, listen: false)
                              .chooseCategory(category);
                          Navigator.pop(context);
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Score more'),
                              content: Text(
                                  'You need to have more IQ than 95 to unlock this Category.Your current IQ is ${Provider.of<Scorevalue>(context, listen: false).showscore.toStringAsFixed(2)}'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Got it'))
                              ],
                            ),
                          );
                        }
                        // setState(() {
                        //   category = 'Hacking';
                        // });
                        //Earlier this used to be a Stateful Widget now since
                        // we learnt about the  Provider package we are using it
                        // for state mangement in this app.
                      },
                      colour: inactiveCard,
                      childcard: const CardContent(
                          label: 'Network', image: 'Network')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                      onCategory: () {
                        if (Provider.of<Scorevalue>(context, listen: false)
                                .showscore >
                            102) {
                          category = 'IT_Tools';
                          Provider.of<CategoryData>(context, listen: false)
                              .chooseCategory(category);
                          Navigator.pop(context);
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Score more'),
                              content: Text(
                                  'You need to have more IQ than 102 to unlock this Category.Your current IQ is ${Provider.of<Scorevalue>(context, listen: false).showscore.toStringAsFixed(2)}'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Got it'))
                              ],
                            ),
                          );
                        }
                      },
                      colour: inactiveCard,
                      childcard: const CardContent(
                          label: 'IT Tools', image: 'IT_Tools')),
                ),
                Expanded(
                  child: ReuseableCard(
                      onCategory: () {
                        if (Provider.of<Scorevalue>(context, listen: false)
                                .showscore >
                            107) {
                          category = 'Web_Dev';
                          Provider.of<CategoryData>(context, listen: false)
                              .chooseCategory(category);
                          Navigator.pop(context);
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Keep it up !'),
                              content: Text(
                                  'You need to have more IQ than 107 to unlock this Category.Your current IQ is ${Provider.of<Scorevalue>(context, listen: false).showscore.toStringAsFixed(2)}'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Got it'))
                              ],
                            ),
                          );
                        }
                      },
                      colour: inactiveCard,
                      childcard: const CardContent(
                          label: 'Web Devlopment.', image: 'Web_Dev')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                      onCategory: () {
                        if (Provider.of<Scorevalue>(context, listen: false)
                                .showscore >
                            115) {
                          category = 'Hardware';
                          Provider.of<CategoryData>(context, listen: false)
                              .chooseCategory(category);
                          Navigator.pop(context);
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Its worth it'),
                              content: Text(
                                  'You need to have more IQ than 115 to unlock this Category.Your current IQ is ${Provider.of<Scorevalue>(context, listen: false).showscore.toStringAsFixed(2)}'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Got it'))
                              ],
                            ),
                          );
                        }
                      },
                      colour: inactiveCard,
                      childcard: const CardContent(
                          label: 'Hardware', image: 'Hardware')),
                ),
                Expanded(
                  child: ReuseableCard(
                      onCategory: () {
                        if (Provider.of<Scorevalue>(context, listen: false)
                                .showscore >
                            128) {
                          category = 'Hacking';
                          Provider.of<CategoryData>(context, listen: false)
                              .chooseCategory(category);
                          Navigator.pop(context);
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('You can do it.'),
                              content: Text(
                                  'You need to have more IQ than 128 to unlock this Category.Your current IQ is  ${Provider.of<Scorevalue>(context, listen: false).showscore.toStringAsFixed(2)}'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Got it'))
                              ],
                            ),
                          );
                        }
                      },
                      colour: inactiveCard,
                      childcard: const CardContent(
                          label: 'Hacking', image: 'Hacking')),
                ),
              ],
            ),
          ],
        ));
  }
}
