import 'package:easy_firebase/Firestore/firestore_func.dart';
import 'package:easy_firebase/easy_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart'; 

class FireStoreDB {
  Future<void> createUser(String usr,String url) async {
    FireStore fireStore= EasyFire().getFirestoreObject();
    Map<String,dynamic> user = {
      "username": usr,
      "avatar": url,
      "friends" : [],
      "favSongs" : []
    };
    await fireStore.setData("User", FirebaseAuth.instance.currentUser!.uid, user);
  }

  Future<void> addHabit(int habitCode,int noOfHabits) async {
    var fireStore= EasyFire().getFirestoreObject().getFirestoreInstance();
    Map<String, dynamic> habit={};
    await fireStore.collection("Habits").doc("$habitCode").get().then((value) {
      if(value.data()!=null)
      {
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;
        habit=data;
      }
    });
    fireStore
    .collection("User")
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .collection("habits")
    .doc("$noOfHabits")
    .set(habit);
  }
}