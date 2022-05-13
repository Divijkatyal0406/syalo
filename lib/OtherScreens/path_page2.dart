import 'package:flutter/material.dart';
import 'package:syalo/OtherScreens/request_learning_path.dart';
import 'package:syalo/OtherScreens/search_results.dart';
import 'package:syalo/OtherScreens/self_learn_paths.dart';
import 'package:syalo/OtherScreens/sounds.dart';
import 'package:syalo/model/empty_box.dart';

class PathPage2 extends StatelessWidget {
  const PathPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'New',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
              Text(
                'see all',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Sounds(),
                      ),
                    );
                  },
                  child: const EmptyBox()),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelfLearn(),
                      ),
                    );
                  },
                  child: const EmptyBox()),
            ],
          ),
          const SizedBox(height: 55),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Recommended',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
              Text(
                'see all',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RequestLearningPath(),
                      ),
                    );
                  },
                  child: const EmptyBox()),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchResult(),
                      ),
                    );
                  },
                  child: const EmptyBox()),
            ],
          ),
          const SizedBox(height: 55),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Anxiety',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
              Text(
                'see all',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              EmptyBox(),
              EmptyBox(),
            ],
          ),
          const SizedBox(height: 55),
        ],
      ),
    );
  }
}
