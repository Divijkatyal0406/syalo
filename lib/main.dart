import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:syalo/screens/mainframe.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:syalo/screens/onboarding_screens/welcome_screen.dart';
//Uncomment next line to use signOut()

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox<Map<dynamic, dynamic>>("User");
  runApp(const SyaloApp());
}

class SyaloApp extends StatefulWidget {
  const SyaloApp({Key? key}) : super(key: key);

  @override
  State<SyaloApp> createState() => _SyaloAppState();
}

class _SyaloAppState extends State<SyaloApp> {
  late Mixpanel mixpanel;
  final Box _box = Hive.box<Map<dynamic, dynamic>>("User");

  @override
  void initState() {
    super.initState();
    initMixpanel();
    try {
      _box.add({"optionsSelected": []});
    } catch (e) {}
  }

  Future<void> initMixpanel() async {
    mixpanel = await Mixpanel.init("1e307809e3aca420e9241fc84d0164cf",
        optOutTrackingDefault: false);
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
      home: FirebaseAuth.instance.currentUser != null
          ? const MainFrame()
          : const WelcomeScreen(),
    );
    // home: RecommendedHabitsScreen());
  }
}
