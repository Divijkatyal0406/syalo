import 'package:flutter/material.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:syalo/screens/onboarding_screens/auth.dart';
import 'package:firebase_core/firebase_core.dart';
//Uncomment next line to use signOut()
//import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SyaloApp());
}

class SyaloApp extends StatefulWidget {
  const SyaloApp({Key? key}) : super(key: key);

  @override
  State<SyaloApp> createState() => _SyaloAppState();
}

class _SyaloAppState extends State<SyaloApp> {
  late Mixpanel mixpanel;

  @override
  void initState() {
    super.initState();
     initMixpanel();
  }

   Future<void> initMixpanel() async {
     mixpanel = await Mixpanel.init("1e307809e3aca420e9241fc84d0164cf",
         optOutTrackingDefault: false);
   }

  @override
  Widget build(BuildContext context) {
    //FirebaseAuth.instance.signOut();
    //FireStoreDB().addHabit("Random Happy Faces",1);
    //print(FireStoreDB().getHabitsList());
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SuprSelf',
      // theme: ThemeData(
      // ),
      // home: FirebaseAuth.instance.currentUser != null
      //     ? const MainFrame()
      //     : const WelcomeScreen(),
      home: AuthScreen(),
    );
  }
}
