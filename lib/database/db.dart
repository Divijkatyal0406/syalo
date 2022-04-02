import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> addHabit(String habitName,int noOfHabits) async {
    var fireStore= EasyFire().getFirestoreObject().getFirestoreInstance();
    Map<String, dynamic> habit={};
    await fireStore.collection("Habits").doc(habitName).get().then((value) {
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

  Future<List> getOngoingHabits() async {
    var fireStore= EasyFire().getFirestoreObject().getFirestoreInstance();
    QuerySnapshot querySnapshot = await fireStore
    .collection("User")
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .collection("habits")
    .get();
    var onGoingList = querySnapshot.docs.map((doc) => doc.data()).toList();
    //print(allData[0].runtimeType);
    return onGoingList;
  }

  Future<List> getHabitsList() async { 
    var fireStore= EasyFire().getFirestoreObject().getFirestoreInstance();
    QuerySnapshot querySnapshot = await fireStore
    .collection("Habits")
    .get();
    var allHabits = querySnapshot.docs.map((doc) => doc.data()).toList();
    List temp=[];
    for(int i=0;i<allHabits.length;i++) {
      var x= allHabits[i] as Map;
      temp.add({
        "name": x["name"],
        "imageUrl": x["imageUrl"]
      });
    }
    //print(temp);
    return temp;
  }

}