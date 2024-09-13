import 'package:fit_journey/src/core/utils/app_assets.dart';
import 'package:fit_journey/src/modules/workout/model/workout_model.dart';
import 'package:flutter/material.dart';

class WorkoutProvider with ChangeNotifier {
  bool isLoading = true;
  bool isSelectMode = false;
  int selectedDayIndex = 4;
  List<WorkoutModel> workouts = <WorkoutModel>[];
  WorkoutModel currentWorkout = WorkoutModel();
  List<String> images = <String>[];
  int currentCarousalIndex = 0;
  // bool rep1= true;
  // bool rep2= true;
  // bool rep3= false;


  WorkoutProvider() {
    workouts.add(WorkoutModel(
        id: 1,
        title: "Reverse Crunch",
        timeLimit: "3 Minutes",
        description:
            "Focus on engaging your lower abs by bringing your knees toward your chest while lifting your hips off the ground. Perform in slow, controlled motions for optimal core activation.",
        image: AppAssets.reverseCrunches,
        isSelected: false,
        
        rep1: true,
        rep2: true,
        rep3: false,
        
        ));
    workouts.add(WorkoutModel(
        id: 2,
        title: "Leg Press Machine",
        timeLimit: "5 Minutes",
        description: "Push the weighted platform with your feet, focusing on working your quads, hamstrings, and glutes. Adjust the seat position to ensure proper knee alignment and avoid injury.",
        image: AppAssets.legPress,
        isSelected: false,
        rep1: true,
        rep2: true,
        rep3: false,));
    workouts.add(WorkoutModel(
        id: 3,
        title: "Overhead Bar Extension",
        timeLimit: "12 Minutes",
        description: "Using a barbell or cable, extend your arms overhead to work your triceps. Keep elbows close to your head and focus on slow, controlled movements to avoid strain.",
        image: AppAssets.overheadBar,
        isSelected: false,
        rep1: true,
        rep2: true,
        rep3: false,));
    workouts.add(WorkoutModel(
        id: 4,
        title: "Lateral Raises",
        timeLimit: "3 Minutes",
        description: "Lift dumbbells out to your sides to shoulder height, working the deltoids. Maintain a slight bend in your elbows and control the weights on the way down for muscle isolation.",
        image: AppAssets.lateralRaises,
        isSelected: false,
        rep1: true,
        rep2: true,
        rep3: false,));
    workouts.add(WorkoutModel(
        id: 5,
        title: "Advanced Workout Routine",
        timeLimit: "3 Minutes",
        description: "Incorporate compound movements, supersets, and high-intensity interval training to push your strength and endurance. Focus on progression by increasing weights or reps each week.",
        image: AppAssets.advancedWorkout,
        isSelected: false,
        rep1: true,
        rep2: true,
        rep3: false,));
    workouts.add(WorkoutModel(
        id: 6,
        title: "Bungee Jumping",
        timeLimit: "6 Minutes",
        description: "Experience an adrenaline rush by leaping from a height while being securely attached to a bungee cord. Ensure proper safety gear and follow all instructions for a thrilling, safe adventure.",
        image: AppAssets.bungeeJumping,
        isSelected: false,
        rep1: true,
        rep2: true,
        rep3: false,));
    workouts.add(WorkoutModel(
        id: 7,
        title: "Running",
        timeLimit: "8 Minutes",
        description: "Build endurance and cardiovascular health by running at a steady pace. Incorporate intervals of sprints or hill runs to improve speed and stamina over time.",
        image: AppAssets.running,
        isSelected: false,
        rep1: true,
        rep2: true,
        rep3: false,));
    workouts.forEach((value) {
      images.add(value.image.toString());
    });
    currentWorkout = workouts[0];
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

  updateSelectMode() {
    isSelectMode = !isSelectMode;
    notifyListeners();
  }

  updateSelectWorkOut(int index) {
    workouts[index].isSelected = !workouts[index].isSelected!;
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

  updateCarousalExercise(int index) {
    currentCarousalIndex = index;
    currentWorkout = workouts[index];
    notifyListeners();
  }

  updateRep1(bool value){
    currentWorkout.rep1 = value;
    notifyListeners();
  }
  updateRep2(bool value){
    currentWorkout.rep2 = value;
    notifyListeners();
  }
  updateRep3(bool value){
    currentWorkout.rep3 = value;
    notifyListeners();
  }
}
