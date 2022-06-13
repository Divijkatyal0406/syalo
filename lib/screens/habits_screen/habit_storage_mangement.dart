import 'package:dio/dio.dart';

import 'package:syalo/screens/habits_screen/models/define_habit_models.dart';
import 'package:syalo/screens/habits_screen/models/get_habits_model.dart';

class HabitService {
  final Dio _dio = Dio();
  String URL = "https://suprself.herokuapp.com/habit/add/";
  late Response response;
  Future<String> addHabits({required Habit habit}) async {
    // print({
    //   "userId": userId,
    //   "habitId": habitId,
    //   "name": name,
    //   "repeatDays": repeatDays,
    //   "image": image,
    //   "remainder": remainder,
    //   "reason": reason,
    // });
    try {
      response = await _dio.post(URL, data: habit.toJson());
      // print(response.data);
      // print(response.statusCode);
      // if (response.statusCode! <= 299) {
      //   return "Success";
      // } else if (response.statusCode! < 500) {
      //   return "Failed";
      // } else {
      //   return "Server Problem";
      // }
    } on DioError {
      // print("This is what is returning " + e.message);
      // print(e.requestOptions.data);
      return "Failed";
    } on Exception {
      // print("Failed");
      return "Failed";
    }
    return response.statusCode! < 300 ? "Success" : 'Failed';
    // return "Success";
  }

  Future<List<GetHabit>> getData({required String userId}) async {
    // print("called getData");
    List<GetHabit> _habits = [];
    try {
      Response response =
          await _dio.get("https://suprself.herokuapp.com/habit/get/all");
      // print(response.data);

      _habits = getHabitFromJson(response.data);
      // print(response.data);
    } catch (e) {
      // print("Failed");
      // print(e);
      return _habits;
    }
    return _habits;
  }

  void updateStreak(
      {required String userId,
      required String habitId,
      required int streak}) async {
    await _dio.post("https://suprself.herokuapp.com/$habitId/$userId/streak",
        data: {"streak": streak});
  }
}
