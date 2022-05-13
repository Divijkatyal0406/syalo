import 'package:flutter/material.dart';
import 'package:syalo/screens/onboarding_screens/how_anxiety.dart';
import 'package:syalo/screens/onboarding_screens/how_energetic.dart';
import 'package:syalo/screens/onboarding_screens/how_much_calm.dart';
import 'package:syalo/screens/onboarding_screens/how_productive.dart';
import 'package:syalo/screens/onboarding_screens/share_friends.dart';

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
            SizedBox(
              height: 500,
              width: double.infinity,
              child: Image.asset(
                "assets/onboarding/fly.png",
                fit: BoxFit.fill,
              ),
            ),
            IconButton(
                onPressed: () {
                  switch (widget.tag) {
                    case "Default Mood":
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => CalmMindScreen()));
                      break;
                    case "Anxiety":
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => ProductiveScreen()));

                      break;
                    case "Energetic":
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => AnxietyScreen()));

                      break;
                    case "Calm Mind":
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => EnergeticScreen()));

                      break;
                    case "Productive":
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const ShareWithFriendsScreen()));

                      break;
                    default:
                  }
                },
                icon: const Icon(Icons.fast_forward))
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
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              for (var i = 0; i < widget.items.length; i++)
                if (currentSelection == i)
                  selectionButton(
                      item: widget.items[i], color: Colors.blueGrey, index: i)
                else
                  selectionButton(
                      item: widget.items[i], color: Colors.white, index: i),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/onboarding/friendship.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget selectionButton(
      {required String item, required Color color, required index}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentSelection = index;
          });
        },
        child: Container(
          width: double.infinity,
          key: ValueKey(item),
          decoration: BoxDecoration(
              border: Border.all(),
              color: color,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              item,
              style: const TextStyle(
                fontSize: 24,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
