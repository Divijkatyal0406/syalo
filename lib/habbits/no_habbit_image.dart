import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoTransactionImage extends StatelessWidget {
  const NoTransactionImage(this.isLandscape);

  final bool isLandscape;

  @override
  Widget build(BuildContext context) {
    final double imgHeight = isLandscape ? 0.7 : 0.6;

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(
              'No Habits Added Yet!',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),
              textAlign:TextAlign.center,
            ),
            const SizedBox(height: 60),
            Image.asset(
              'assets/images/waiting.png',
              height: constraints.maxHeight * imgHeight,
            ),
          ],
        ),
      );
    });
  }
}
