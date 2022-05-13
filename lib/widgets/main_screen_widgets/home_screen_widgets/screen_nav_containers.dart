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
        margin: const EdgeInsets.only(bottom: 10.0),
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
              left: 7,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 4,
                      offset: Offset(4, 8), // Shadow position
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: const TextStyle(
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
