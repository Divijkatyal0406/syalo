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
              'No Journals Added Yet!',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      );
    });
  }
}
