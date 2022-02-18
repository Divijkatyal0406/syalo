import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenNavContainers extends StatelessWidget {
  final String image;
  final String title;

  const ScreenNavContainers(
      {Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 300,
      child: Card(
        margin: EdgeInsets.only(bottom: 10.0),
        elevation: 5.0,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: SizedBox(
                  height: 200,
                  width: 300,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                )),
            Positioned(
              top: 4,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
