import 'package:flutter/material.dart';

class LearingPath extends StatelessWidget {
  var headings = ["Daily Learning", "Continue...", "Self Esteem"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Learing Paths',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: ListView.builder(
          itemCount: 5,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          itemBuilder: (BuildContext context, int index) {
            if (index % 2 == 0) {
              return _buildCarousel(context, index ~/ 2);
            } else {
              return const Divider();
            }
          },
        ),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(headings[carouselIndex++],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 175.0,
          width: 370,
          child: PageView.builder(
            itemCount: 5,
            controller: PageController(viewportFraction: 0.87),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, carouselIndex, itemIndex);
            },
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () => {
          //article to be shown
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/walk.jpg"),
              fit: BoxFit.fill,
            ),
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(14.0)),
          ),
        ),
      ),
    );
  }
}
