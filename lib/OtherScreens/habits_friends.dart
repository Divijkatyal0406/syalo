import 'package:easy_firebase/easy_firebase.dart';
import 'package:flutter/material.dart';
import 'package:syalo/model/habit_container2.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HabitsFriends extends StatefulWidget {
  const HabitsFriends({Key? key}) : super(key: key);

  @override
  State<HabitsFriends> createState() => _HabitsFriendsState();
}

class _HabitsFriendsState extends State<HabitsFriends> {
  Future<List> getFriendsInfo() async {
    var obj = EasyFire().getFirestoreObject().getFirestoreInstance();
    var data = await obj
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    //print(data["friends"]);
    return data["friends"];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getFriendsInfo(),
        builder: (context, snapshot) {
          // Checking if future is resolved or not
          if (snapshot.connectionState == ConnectionState.done) {
            // If we got an error
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occured',
                  style: const TextStyle(fontSize: 18),
                ),
              );

              // if we got our data
            } else if (snapshot.hasData) {
              // Extracting data from snapshot object
              var data = snapshot.data as List;
              return Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Name',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 20,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            Text(
                              'Today',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 20,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            Text(
                              'Score',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 20,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                          color: Color.fromRGBO(0, 0, 0, 1), thickness: 1),
                      const SizedBox(height: 10),
                      ListView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return HabitContainer2(
                                image_url: data[index]["imageUrl"],
                                name: data[index]["name"],
                                habitsCompleted: data[index]["habitsCompleted"],
                                score: data[index]["score"]);
                          }),
                    ],
                  ),
                ),
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
