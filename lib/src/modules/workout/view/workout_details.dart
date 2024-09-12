import 'dart:async';

import 'package:fit_journey/src/core/utils/app_assets.dart';
import 'package:fit_journey/src/core/utils/app_colors.dart';
import 'package:fit_journey/src/core/utils/app_fonts.dart';
import 'package:fit_journey/src/modules/cusotm_elements/custom_button.dart';
import 'package:fit_journey/src/modules/cusotm_elements/custom_text.dart';
import 'package:fit_journey/src/modules/workout/provider/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WorkoutDetails extends StatelessWidget {
  const WorkoutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final workoutProvider =
        Provider.of<WorkoutProvider>(context, listen: false);

    Future<bool> onWillPopUp() async {
      if (workoutProvider.isSelectMode) {
        workoutProvider.updateSelectMode();
        return false;
      } else {
        Navigator.pop(context);
        return true;
      }
    }

    return WillPopScope(
      onWillPop: () => onWillPopUp(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (workoutProvider.isSelectMode) {
                          workoutProvider.updateSelectMode();
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child:  Container(
                        height: 30.sp,
                        width: 30.sp,
                        child: Icon(Icons.arrow_back_ios,size: 20.sp,))),
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: CustomText(
                      fontSize: 20.sp,
                      text: 'Set Workout Goal',
                      fontFamily: AppFonts.PoppinsBold,
                    ),
                  ),
                  Container(),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    fontSize: 16.sp,
                    text: 'Monday, Feb 16,2024',
                    fontFamily: AppFonts.PoppinsBold,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CustomText(
                      fontSize: 16.sp,
                      text: 'See All',
                      textColor: AppColors.appThemeColor,
                      fontFamily: AppFonts.PoppinsBold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              daysSelection(context),
              SizedBox(
                height: 20.h,
              ),
              workSelection(context),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 3.h),
                    child: CustomButton(
                      buttonText: "Set Goal",
                      width: 0.5.sw,
                      height: 50.h,
                      buttonColor: AppColors.appThemeColor,
                      buttonTextColor: AppColors.white,
                      borderRadius: 10.r,
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget daysSelection(BuildContext context) {
    final workoutProvider = Provider.of<WorkoutProvider>(context, listen: true);
    // Future.delayed(Duration(seconds: 1),(){
    // workoutProvider.updateIsLoading();

    // });

    return SizedBox(
      height: 35.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: workoutProvider.days.length,
        itemBuilder: (context, index) {
          return ListItemDay(index: index, workoutProvider: workoutProvider);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 5.w,
          );
        },
      ),
    );
  }

  Widget ListItemDay(
      {required int index, required WorkoutProvider workoutProvider}) {
    return InkWell(
      onTap: () {
        workoutProvider.updateSelectedDay(index);
      },
      child: Container(
        width: 50.w,
        // height: 25.h,
        decoration: BoxDecoration(
            color: workoutProvider.selectedDayIndex == index
                ? AppColors.appThemeColor
                : AppColors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(7.r)),
        child: Center(
          child: CustomText(
            text: workoutProvider.days[index],
            textColor: workoutProvider.selectedDayIndex == index
                ? AppColors.white
                : AppColors.black,
            fontSize: 12.sp,
            fontFamily: AppFonts.PoppinsMedium,
          ),
        ),
      ),
    );
  }

  Widget workSelection(BuildContext context) {
    final workoutProvider = Provider.of<WorkoutProvider>(context, listen: true);

    return Expanded(
      child: ListView.separated(
        itemCount: workoutProvider.workouts.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return workoutSelectionTile(index, workoutProvider);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 5.h,
          );
        },
      ),
    );
  }

  Widget workoutSelectionTile(int index, WorkoutProvider workoutProvider) {
    return GestureDetector(
      onLongPress: () {
        workoutProvider.updateSelectMode();
      },
      onTap: (){
        if(workoutProvider.isSelectMode){
          workoutProvider.updateSelectWorkOut(index);
        }
      },
      child: Opacity(
        opacity: workoutProvider.workouts[index].isSelected!? 0.5:1,
        child: Row(
          children: [
            if (workoutProvider.isSelectMode)
              GestureDetector(
                onTap: () {
                  workoutProvider.updateSelectWorkOut(index);
                },
                child: workoutProvider.workouts[index].isSelected!
                    ? Container(
                        width: 25.sp,
                        height: 25.sp,
                        margin: EdgeInsets.only(right: 10.w),
                        decoration: BoxDecoration(
                            color: AppColors.appThemeColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.appThemeColor)),
                        child: Center(
                          child: Icon(
                            Icons.check,
                            color: AppColors.white,
                            size: 20.sp,
                          ),
                        ),
                      )
                    : Container(
                        width: 25.sp,
                        height: 25.sp,
                        margin: EdgeInsets.only(right: 10.w),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.grey.withOpacity(0.4))),
                      ),
              ),
            ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  workoutProvider.workouts[index].image!,
                  width: 140.w,
                  height: 95.h,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomText(
                          text: workoutProvider.workouts[index].title!,
                          fontSize: 18.sp,
                          maxLines: 2,
                          fontFamily: AppFonts.PoppinsRegular,
                          textColor: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.play_circle,
                        color: AppColors.grey.withOpacity(0.3),
                        size: 16.sp,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      CustomText(
                        text: workoutProvider.workouts[index].timeLimit!,
                        textColor: AppColors.grey.withOpacity(0.4),
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
