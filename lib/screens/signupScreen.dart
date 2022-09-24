import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:csiq_quiz/screens/Inputpage.dart';
import 'package:flutter/material.dart';
import '../amplifyconfiguration.dart';
import '../reuseableDatas/constant.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email = 'cctk07@protonmail.com';
  String password = '123456789';
  // late String email;
  // late String password;
  late String code;
  bool isSignUpComplete = false;

  Future<void> _configureAmplify() async {
    // Add any Amplify plugins you want to use
    final authPlugin = AmplifyAuthCognito();
    await Amplify.addPlugin(authPlugin);

    // You can use addPlugins if you are going to be adding multiple plugins
    // await Amplify.addPlugins([authPlugin, analyticsPlugin]);

    // Once Plugins are added, configure Amplify
    // Note: Amplify can only be configured once.
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      safePrint(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  Future<void> signUpUser() async {
    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.email: email,
        // additional attributes as needed
      };
      final result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      setState(() {
        isSignUpComplete = result.isSignUpComplete;
      });
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  Future<void> signOutCurrentUser() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> confirmUser() async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: email,
        confirmationCode: code,
      );
      if (result.isSignUpComplete) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const InputPage()),
        );
      }
      setState(() {
        isSignUpComplete = result.isSignUpComplete;
      });
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _configureAmplify();
  }

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
                Image.asset('assets/signup.png', width: 150, height: 200),
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
                    code = value;
                  },
                  decoration: InputDecoration(
                    label: Row(
                      children: [
                        Image.asset('assets/top-secret.png',
                            width: 30, height: 30),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Secret Code ...'),
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
            Container(
              margin: const EdgeInsets.fromLTRB(100, 15, 100, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xffFC9918),
              ),
              child: TextButton(
                  onPressed: () {
                    signUpUser();
                  },
                  child: const Text(
                    'Click for Code',
                    style: kbuttontext,
                  )),
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
                    confirmUser();
                  },
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: kbuttontext,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
