import 'package:flutter/material.dart';


class ClassifyButtons extends StatelessWidget {
  final String imageUrl;
  ClassifyButtons({Key? key,required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
              boxShadow: [BoxShadow(
                color: Colors.grey,
                blurRadius: 6.0,
              ),]
          ),
          child: CircleAvatar(
            radius: 28.0,
            backgroundColor: Colors.white,
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5.0),
                child: Image.network(imageUrl)),
          ),
        ),
        SizedBox(height: 5.0,),
        Text("Meditate",style: TextStyle(fontSize: 15),)
      ],
    );
  }
}
