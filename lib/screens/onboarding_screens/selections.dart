import 'package:flutter/material.dart';
import 'package:syalo/screens/onboarding_screens/how_anxiety.dart';
import 'package:syalo/screens/onboarding_screens/how_energetic.dart';
import 'package:syalo/screens/onboarding_screens/how_much_calm.dart';
import 'package:syalo/screens/onboarding_screens/how_productive.dart';
import 'package:syalo/screens/onboarding_screens/share_friends.dart';
import 'package:syalo/screens/onboarding_screens/transitions.dart';

// ignore: must_be_immutable
class BaseSelection extends StatefulWidget {
  String tag;
  String title;
  List<String> items;
  BaseSelection({
    Key? key,
    required this.title,
    required this.items,
    required this.tag,
  }) : super(key: key);

  @override
  State<BaseSelection> createState() => _BaseSelectionState();
}

class _BaseSelectionState extends State<BaseSelection> {
  int currentSelection = -1;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Stack(alignment: AlignmentDirectional.topEnd, children: [
            Container(
              width: double.infinity,
            ),
            Positioned(
              left: 0,
              child: SizedBox(
                height: 150,
                width: width * .5,
                child: Image.asset(
                  "assets/onboarding/fly.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  switch (widget.tag) {
                    case "Default Mood":
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: CalmMindScreen()));
                      break;
                    case "Anxiety":
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: ProductiveScreen()));

                      break;
                    case "Energetic":
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: AnxietyScreen()));

                      break;
                    case "Calm Mind":
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: EnergeticScreen()));

                      break;
                    case "Productive":
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const ShareWithFriendsScreen()));

                      break;
                    default:
                  }
                },
                icon: const Icon(
                  Icons.fast_forward,
                  size: 30,
                ))
          ]),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              for (var i = 0; i < widget.items.length; i++)
                if (currentSelection == i)
                  selectionButton(
                      item: widget.items[i], color: Colors.lightBlue, index: i)
                else
                  selectionButton(
                      item: widget.items[i], color: Colors.white, index: i),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 150,
                    width: width * .5,
                    child: Image.asset(
                      "assets/onboarding/friendship.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget selectionButton({
    required String item,
    required Color color,
    required index,
  }) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentSelection = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: currentSelection == index ? width * .95 : width * .85,
          key: ValueKey(item),
          decoration: BoxDecoration(
              border: Border.all(
                color: color == Colors.white ? Colors.black : color,
              ),
              color: color,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              item,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
            )),
          ),
        ),
      ),
    );
  }
}
