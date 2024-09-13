import 'package:fit_journey/src/core/utils/app_assets.dart';
import 'package:fit_journey/src/core/utils/app_colors.dart';
import 'package:fit_journey/src/core/utils/app_fonts.dart';
import 'package:fit_journey/src/modules/cusotm_elements/custom_button.dart';
import 'package:fit_journey/src/modules/cusotm_elements/custom_text.dart';
import 'package:fit_journey/src/modules/workout/view/workout_details.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatelessWidget {
  // var cartProvider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                activityStatistics(context),
                SizedBox(
                  height: 10.h,
                ),
                summary(),
                SizedBox(
                  height: 10.h,
                ),
                myProgram(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget activityStatistics(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: CustomText(
                fontSize: 20.sp,
                text: 'Set Workout Goal',
                fontFamily: AppFonts.PoppinsBold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              fontSize: 16.sp,
              text: 'Activity Statistics',
              fontFamily: AppFonts.PoppinsBold,
            ),
            CustomButton(
              buttonText: "Set Goal",
              buttonTextSize: 12.sp,
              width: 120.w,
              height: 35.h,
              buttonColor: AppColors.appThemeColor,
              buttonTextColor: AppColors.white,
              borderRadius: 7.r,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>WorkoutDetails()));
              },
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 180.h,
          width: 0.95.sw,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calories and Time Spent Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Calories',
                        fontSize: 12.sp,
                        textColor: AppColors.grey,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: ' 160,56',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontFamily: AppFonts.PoppinsBold,
                                  fontSize: 14.sp),
                            ),
                            TextSpan(
                              text: ' kCal',
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontFamily: AppFonts.PoppinsMedium,
                                  fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      CustomText(
                        text: 'Time Spend',
                        fontSize: 12.sp,
                        textColor: AppColors.grey,
                      ),
                      CustomText(
                        text: ' 12.29.84',
                        fontSize: 14.sp,
                        textColor: AppColors.black,
                        fontFamily: AppFonts.PoppinsBold,
                      ),
                    ],
                  ),
                  // Bar Chart Section
                  SizedBox(
                    width: 200.w,
                    height: 160.h,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 10,
                        barTouchData: BarTouchData(enabled: false),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                const style = TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                );
                                switch (value.toInt()) {
                                  case 0:
                                    return const Text('SUN', style: style);
                                  case 1:
                                    return const Text('MON', style: style);
                                  case 2:
                                    return const Text('TUE', style: style);
                                  case 3:
                                    return const Text('WED', style: style);
                                  case 4:
                                    return const Text('THU', style: style);
                                  case 5:
                                    return const Text('FRI', style: style);
                                  case 6:
                                    return const Text('SAT', style: style);
                                  default:
                                    return Container();
                                }
                              },
                              reservedSize: 30,
                            ),
                          ),
                          rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          leftTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        gridData: const FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(
                                toY: 4,
                                color: Colors.orange,
                                width: 8.sp,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(
                                toY: 7,
                                color: Colors.orangeAccent,
                                width: 8.sp,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(
                                toY: 6,
                                color: Colors.deepOrange,
                                width: 8.sp,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                toY: 8,
                                color: Colors.orangeAccent,
                                width: 8.sp,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 4,
                            barRods: [
                              BarChartRodData(
                                toY: 9,
                                color: Colors.green,
                                width: 8.sp,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(
                                toY: 7,
                                color: Colors.lightGreen,
                                width: 8.sp,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 6,
                            barRods: [
                              BarChartRodData(
                                toY: 9,
                                color: Colors.green,
                                width: 8.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget summary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          fontSize: 16.sp,
          text: 'Summary',
          fontFamily: AppFonts.PoppinsBold,
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 220.h,
              width: 0.45.sw,

              decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    fontSize: 16.sp,
                    text: 'Overall Progress',
                    textColor: AppColors.black,
                    fontFamily: AppFonts.PoppinsRegular,
                  ),
                  SizedBox(
                    height: 155.h,
                    width: 0.41.sw,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                  value: 75,
                                  radius: 30.r,
                                  color: AppColors.grey.withOpacity(0.4),
                                  title: '75%',
                                  showTitle: false),
                              PieChartSectionData(
                                value: 25,
                                radius: 30.r,
                                showTitle: false,
                                color: AppColors.appThemeColor.withOpacity(0.7),
                                title: '25%',
                              ),
                            ],
                          ),
                        ),
                        CustomText(text: "25%")
                      ],
                    ),
                  ),
                ],
              ),
              // child: Column(
              //   children: [

              //   ],
              // ),
            ),
            Container(
              height: 220.h,
              width: 0.45.sw,
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                  color: AppColors.appThemeColor,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    fontSize: 12.sp,
                    text: 'Meal Guide',
                    textColor: AppColors.white,
                    fontFamily: AppFonts.PoppinsBold,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  mealGuidTile(title: "8AM", subtitle: "Breakfast"),
                  SizedBox(
                    height: 7.h,
                  ),
                  mealGuidTile(title: "12AM", subtitle: "Lunch"),
                  SizedBox(
                    height: 7.h,
                  ),
                  mealGuidTile(title: "8PM", subtitle: "Dinner"),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget mealGuidTile({required String title, required String subtitle}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              fontSize: 8.sp,
              fontFamily: AppFonts.PoppinsBold,
              textColor: AppColors.white,
            ),
            CustomText(
                text: subtitle,
                fontSize: 14.sp,
                fontFamily: AppFonts.PoppinsBold,
                textColor: AppColors.white),
          ],
        ),
        Icon(
          Icons.info,
          color: AppColors.white,
          size: 25.sp,
        )
      ],
    );
  }

  Widget myProgram() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          fontSize: 16.sp,
          text: 'My Program',
          fontFamily: AppFonts.PoppinsBold,
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: double.infinity,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return myProgramTile();
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 5.h,
              );
            },
          ),
        )
      ],
    );
  }

  Widget myProgramTile() {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                AppAssets.placeholderImage,
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
                        text: 'Overhead Bar Extension',
                        fontSize: 18.sp,
                        maxLines: 2,
                        fontFamily: AppFonts.PoppinsRegular,
                        textColor: AppColors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h,),
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
                      text: "4 Minutes Left",
                      textColor: AppColors.grey.withOpacity(0.4),
                      fontSize: 12.sp,
                    ),
                  ],
                ),
                SizedBox(height: 3.h,),

                Row(
                  children: [
                    Expanded(
                        child:  LinearProgressIndicator(
                      value: 0.5,
                      color: AppColors.black.withOpacity(0.3),
                    
                      
                    )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}
