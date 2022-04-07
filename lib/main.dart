import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:syalo/database/db.dart';
import 'package:syalo/journals/journalHome.dart';
import 'package:syalo/screens/login_signup.dart';
import 'package:syalo/habbits/habbitHome.dart';
import 'package:syalo/screens/home_screen.dart';
import 'package:syalo/screens/mainframe.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:syalo/screens/onboarding_screens/welcome_screen.dart';
import 'package:syalo/screens/onboarding_video.dart';
import 'package:syalo/screens/profile_screen.dart';
import 'package:syalo/songTracks/homePage.dart';


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
    mixpanel = await Mixpanel.init("1e307809e3aca420e9241fc84d0164cf", optOutTrackingDefault: false);
  }

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth.instance.signOut();
    //FireStoreDB().addHabit("Random Happy Faces",1);
    //print(FireStoreDB().getHabitsList());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SuprSelf',
      // theme: ThemeData(
      // ),
      home: FirebaseAuth.instance.currentUser!=null ? const MainFrame(): const WelcomeScreen(),
      // home: HabbitScreen(),
    );
  }
}
