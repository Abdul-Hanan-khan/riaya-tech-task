import 'package:fit_journey/src/core/utils/app_assets.dart';
import 'package:fit_journey/src/modules/workout/model/workout_model.dart';
import 'package:flutter/material.dart';

class WorkoutProvider with ChangeNotifier {
  bool isLoading = true;
  bool isSelectMode = false;
  int selectedDayIndex = 4;
  List<WorkoutModel> workouts = <WorkoutModel>[];


  WorkoutProvider(){
    workouts.add(WorkoutModel(1, "Reverse Crunch", "3 Minutes", AppAssets.placeholderImage, false));
    workouts.add(WorkoutModel(2, "Leg Press Machine", "5 Minutes", AppAssets.placeholderImage, false));
    workouts.add(WorkoutModel(3, "Overhead Bar Extension", "12 Minutes", AppAssets.placeholderImage, false));
    workouts.add(WorkoutModel(4, "Lateral Raises", "3 Minutes", AppAssets.placeholderImage, false));
    workouts.add(WorkoutModel(5, "Advanced Workout Routine", "3 Minutes", AppAssets.placeholderImage, false));
    workouts.add(WorkoutModel(6, "Bungee Jumping", "6 Minutes", AppAssets.placeholderImage, false));
    workouts.add(WorkoutModel(7, "Running", "8 Minutes", AppAssets.placeholderImage, false));
    debugPrint("dummy data added");

  }

  List<String> days = [
    'Day 1',
    'Day 2',
    'Day 3',
    'Day 4',
    'Day 5',
    'Day 6',
    'Day 7',
    'Day 8',
    'Day 9',
    'Day 10',
  ];
  
  updateSelectMode(){
    isSelectMode = !isSelectMode;
    notifyListeners();

  }
  updateSelectWorkOut(int index){
    workouts[index].isSelected = !workouts[index].isSelected! ;
    notifyListeners();

  }

  updateIsLoading() {
    isLoading = true;
    // notifyListeners();
    Future.delayed(Duration(seconds: 3), () {
      isLoading = false;
      notifyListeners();
    });
  }
  updateSelectedDay(int index) {
   selectedDayIndex = index;
   notifyListeners();
  }
}
