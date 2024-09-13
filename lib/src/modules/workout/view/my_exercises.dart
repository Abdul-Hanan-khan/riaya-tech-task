import 'package:carousel_slider/carousel_slider.dart';
import 'package:fit_journey/src/core/utils/app_colors.dart';
import 'package:fit_journey/src/core/utils/app_fonts.dart';
import 'package:fit_journey/src/modules/cusotm_elements/custom_button.dart';
import 'package:fit_journey/src/modules/cusotm_elements/custom_text.dart';
import 'package:fit_journey/src/modules/workout/provider/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyExercises extends StatelessWidget {
  const MyExercises({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Column(
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
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 30.sp,
                      padding: EdgeInsets.only(left: 20.w),
                      // width: 50.sp,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20.sp,
                      ))),
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: CustomText(
                  fontSize: 20.sp,
                  text: 'My Exercises',
                  fontFamily: AppFonts.PoppinsBold,
                ),
              ),
              Container(),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                carousalSection(context),
                SizedBox(
                  height: 20.h,
                ),
                otherContent(context),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.timer_rounded,
                    color: AppColors.black,
                    size: 25.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomText(
                    fontSize: 16.sp,
                    text: '03 mins 30 sec',
                    fontFamily: AppFonts.PoppinsRegular,
                  ),
                ],
              ),
              CustomButton(
                buttonText: "Done",
                buttonColor: AppColors.appThemeColor,
                buttonTextColor: AppColors.white,
                width: 100.w,
                borderRadius: 30.r,
                buttonTextSize: 16.sp,
              )
            ],
          )
        ],
      )),
    );
  }

  Widget carousalSection(BuildContext context) {
    final workoutProvider = Provider.of<WorkoutProvider>(context, listen: true);

    return Column(
      children: [
        CustomText(
          text:
              "Exercise (${(workoutProvider.currentCarousalIndex + 1).toString()})",
          fontSize: 14.sp,
        ),
        SizedBox(
          height: 10.h,
        ),
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              workoutProvider.updateCarousalExercise(index);

              // debugPrint(index.toString());
            },
            height: 190.0.h,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: false,
            // autoPlayInterval: Duration(seconds: 3),
            // autoPlayAnimationDuration: Duration(milliseconds: 800),
            // autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: workoutProvider.images.map((item) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 190.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                  Container(
                            width: 50.sp,
                            height: 50.sp,
                            decoration: BoxDecoration(
                                color: AppColors.white.withOpacity(0.3),
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.play_arrow,
                              color: AppColors.white,
                            ),
                          )
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget otherContent(BuildContext context) {
    final workoutProvider = Provider.of<WorkoutProvider>(context, listen: true);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: workoutProvider.currentWorkout.title.toString(),
            fontSize: 20.sp,
            fontFamily: AppFonts.PoppinsBold,
          ),
          // SizedBox(height: 2.h,),
          CustomText(
            text: workoutProvider.currentWorkout.timeLimit.toString(),
            fontSize: 14.sp,
            textColor: AppColors.grey,
            maxLines: 4,
          ),

          SizedBox(
            height: 10.h,
          ),
          CustomText(
            text: workoutProvider.currentWorkout.description.toString(),
            fontSize: 14.sp,
            textColor: AppColors.grey,
            maxLines: 4,
          ),

          Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                value: workoutProvider.currentWorkout.rep1,
                activeColor: AppColors.appThemeColor,
                onChanged: (value) {
                  workoutProvider.updateRep1(value!);
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomText(
                text: "1st Reps",
                fontSize: 16.sp,
                fontFamily: AppFonts.PoppinsMedium,
              ),
              SizedBox(
                width: 20.w,
              ),
              CustomText(
                text: workoutProvider.currentWorkout.rep1!
                    ? "10 mins 02 Seconds"
                    : "---",
                fontSize: 16.sp,
                fontFamily: AppFonts.PoppinsMedium,
                textColor: workoutProvider.currentWorkout.rep1!
                    ? AppColors.appThemeColor
                    : AppColors.black,
              )
            ],
          ),
          Row(
            children: [
              Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  value: workoutProvider.currentWorkout.rep2,
                  activeColor: AppColors.appThemeColor,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (value) {
                    workoutProvider.updateRep2(value!);
                  }),
              SizedBox(
                width: 10.w,
              ),
              CustomText(
                text: "2nd Reps",
                fontSize: 16.sp,
                fontFamily: AppFonts.PoppinsMedium,
              ),
              SizedBox(
                width: 20.w,
              ),
              CustomText(
                text: workoutProvider.currentWorkout.rep2!
                    ? "10 mins 05 Seconds"
                    : "---",
                fontSize: 16.sp,
                fontFamily: AppFonts.PoppinsMedium,
                textColor: workoutProvider.currentWorkout.rep2!
                    ? AppColors.appThemeColor
                    : AppColors.black,
              )
            ],
          ),
          Row(
            children: [
              Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  value: workoutProvider.currentWorkout.rep3,
                  activeColor: AppColors.appThemeColor,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (value) {
                    workoutProvider.updateRep3(value!);
                  }),
              SizedBox(
                width: 10.w,
              ),
              CustomText(
                text: "3rd Reps",
                fontSize: 16.sp,
                fontFamily: AppFonts.PoppinsMedium,
              ),
              SizedBox(
                width: 20.w,
              ),
              CustomText(
                text: workoutProvider.currentWorkout.rep3!
                    ? "10 mins 02 Seconds"
                    : "---",
                fontSize: 16.sp,
                fontFamily: AppFonts.PoppinsMedium,
                textColor: workoutProvider.currentWorkout.rep3!
                    ? AppColors.appThemeColor
                    : AppColors.black,
              )
            ],
          ),
        ],
      ),
    );
  }
}
  // Container(
  //                           width: 50.sp,
  //                           height: 50.sp,
  //                           decoration: BoxDecoration(
  //                               color: AppColors.white.withOpacity(0.3),
  //                               shape: BoxShape.circle),
  //                           child: Icon(
  //                             Icons.play_arrow,
  //                             color: AppColors.white,
  //                           ),
  //                         )