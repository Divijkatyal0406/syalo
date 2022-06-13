import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OnboardingService {
  final Dio _dio = Dio();
  String BASEURL = "https://suprself.herokuapp.com/";

  var x = FirebaseAuth.instance;
  Future<String> register({required FirebaseAuth instance}) async {
    try {
      Response response = await _dio.post(
        "/auth/register",
        data: {
          "googleID": instance.currentUser!.uid,
          "email": instance.currentUser!.email,
          "name": instance.currentUser!.displayName,
          "picture": instance.currentUser!.photoURL,
        },
      );
      return response.data['id'];
    } catch (e) {
      return "Invalid";
    }
  }

  void addHabits({required String userId, required String options}) {
    _dio.post("start/add/", data: {
      "userID": userId,
      "selectedHabits": options,
    });
  }
}
