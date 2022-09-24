import 'package:csiq_quiz/screens/loginScreen.dart';
import 'package:csiq_quiz/screens/signupScreen.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import '../amplifyconfiguration.dart';
import '../reuseableDatas/constant.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    _configureAmplify();
  }


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
      safePrint("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }
  // Future<void> _configureAmplify() async {
  //   // Once Plugins are added, configure Amplify
  //   // Note: Amplify can only be configured once.
  //   try {
  //     await Amplify.configure(amplifyconfig);
  //   } on AmplifyAlreadyConfiguredException {
  //     safePrint("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
  //   }
  // }
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // signOutCurrentUser();
                  Navigator.pushNamed(context, '/');
                },
                child: const Icon(
                  Icons.logout_sharp,
                  color: Color(0xffEEEEEE), // add custom icons also
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
            Hero(tag: 'logo',
            child: Image.asset('assets/finallogo.png', width: 350, height: 450)),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding:  EdgeInsets.only(left: 8.0,right: 28.0),
              child:  Center(
                child: Text(
                  '“Simplicity is the soul of efficiency.”',
                 style: TextStyle(fontSize: 20,color: Colors.white,
                 fontFamily: 'amar'),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 60, right: 60, bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(10, 60),
                    backgroundColor: const Color(0xffFFEB139),
                    shape: const StadiumBorder(),
                    side: const BorderSide(
                      color: Colors.black,
                      width: 4,
                    )),
                child: const Text(
                  'Sign Up',
                  style: kbuttontext,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 60, right: 60, bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(10, 60),
                    backgroundColor: const Color(0xffE94560),
                    shape: const StadiumBorder(),
                    side: const BorderSide(
                      color: Colors.black,
                      width: 4,
                    )),
                child: const Text(
                  'Login In',
                  style: kbuttontext,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
