import 'package:flutter/material.dart';

class JournalContainer extends StatelessWidget {
  const JournalContainer(
      {Key? key, required this.topic, required this.description})
      : super(key: key);

  final String topic, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            '12 nov, 21  - 19:52',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 15,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.only(left: 40),
          width: 328,
          height: 145,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            color: Color.fromRGBO(255, 221, 0, 1),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    topic,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 22,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 15,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
