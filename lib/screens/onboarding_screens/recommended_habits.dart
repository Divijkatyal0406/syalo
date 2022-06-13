import 'package:flutter/material.dart';
import 'package:syalo/screens/onboarding_screens/share_friends.dart';
import 'package:syalo/screens/onboarding_screens/transitions.dart';

class RecommendedHabitsScreen extends StatefulWidget {
  const RecommendedHabitsScreen({Key? key}) : super(key: key);

  @override
  State<RecommendedHabitsScreen> createState() =>
      _RecommendedHabitsScreenState();
}

class _RecommendedHabitsScreenState extends State<RecommendedHabitsScreen> {
  bool hasData = true;

  String expectedText = "are adding";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: hasData
                ? () {
                    setState(() {
                      hasData = true;
                      expectedText = "have added";
                    });
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const ShareWithFriendsScreen()));
                  }
                : null,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Text(
                "I Commit to Getting Better",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "We " + expectedText + " some Habits you Need",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
                child: hasData
                    ? ListView(
                        // TODO this listview is based on data from node
                        children: const [
                          RecommendationConatiner(
                            title: "Meditate 10 Mins",
                            imageUrl: "assets/music_images/monk.jpg",
                          ),
                          RecommendationConatiner(
                            title: "Nature Walk",
                            imageUrl: "assets/music_images/nature_walk.jpg",
                          ),
                          RecommendationConatiner(
                            title: "Start Day Without Phone",
                            imageUrl: "assets/music_images/deep_calm.jpg",
                          ),
                        ],
                      )
                    : const Center(child: CircularProgressIndicator()))
          ],
        ),
      ),
    );
  }
}

class RecommendationConatiner extends StatelessWidget {
  final String title, imageUrl;
  const RecommendationConatiner({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Align(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Container(
              height: 150,
              width: width * .90,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Opacity(
              opacity: 0.4,
              child: Container(
                height: 150 / 3,
                width: width * .90,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
