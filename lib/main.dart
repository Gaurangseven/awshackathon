import 'package:csiq_quiz/screens/dashboard.dart';
import 'package:csiq_quiz/screens/homescreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:csiq_quiz/dataclass/scorevalue.dart';
import 'amplifyconfiguration.dart';
import 'reuseableDatas/constant.dart';
import 'package:provider/provider.dart';
import 'dataclass/categorydata.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  runApp(const ComputerQuiz());
}
// void main() {
//   runApp(const ComputerQuiz());
// }

Future<void> configureAmplify() async {
  try {
    final auth = AmplifyAuthCognito();
    await Amplify.addPlugin(auth);

    // call Amplify.configure to use the initialized categories in your app
    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    if (kDebugMode) {
      print('An error occurred configuring Amplify: $e');
    }
  }
}

class ComputerQuiz extends StatelessWidget {
  const ComputerQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryData>(
          create: (BuildContext context) => CategoryData(),
        ),
        ChangeNotifierProvider<Scorevalue>(
            create: (BuildContext context) => Scorevalue())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: kbgcolorscaffold,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
