import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import '../reuseableDatas/constant.dart';
import 'Inputpage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;

  // String email = 'cctk07@protonmail.com';
  // String password = '123456789';
  bool isSignedIn = false;

  Future<void> signOutCurrentUser() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> signInUser() async {
    try {
      final result = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      if (result.isSignedIn) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const InputPage()),
        );
      }

      setState(() {
        isSignedIn = result.isSignedIn;
      });
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff16213E),
        elevation: 70,
        child: Container(
          margin: const EdgeInsets.only(left: 120, right: 120),
          child: Row(
            children: [
              const Text(
                'Secured by AWS',
                style: TextStyle(
                    color: Color(0xffF2F2F2), fontWeight: FontWeight.bold),
              ),
              Image.asset('assets/aws.png', width: 50, height: 50),
            ],
          ),
        ),
      ),
      appBar: AppBar(
          backgroundColor: const Color(0xff16213E),
          toolbarHeight: 50,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Fierce Tech',
                    style: kheading,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  signOutCurrentUser();
                  Navigator.pushNamed(context, '/');
                },
                child: const Icon(
                  Icons.logout_sharp,
                  color: Colors.black, // add custom icons also
                ),
              ),
            ],
          )),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff16213E),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset('assets/login.png', width: 150, height: 200),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffEFEFEF),
                borderRadius: BorderRadius.circular(65),
              ),
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    label: Row(
                      children: [
                        Image.asset('assets/gmail.png', width: 30, height: 30),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Email ...'),
                      ],
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffEFEFEF),
                borderRadius: BorderRadius.circular(65),
              ),
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                child: TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    label: Row(
                      children: [
                        Image.asset('assets/reset-password.png',
                            width: 30, height: 30),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Password ...'),
                      ],
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(100, 10, 100, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xffF66B0E),
              ),
              child: TextButton(
                  onPressed: () {
                    signInUser();
                  },
                  child: const Center(
                    child: Text(
                      'Login',
                      style: kbuttontext,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
