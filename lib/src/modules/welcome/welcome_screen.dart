import 'package:fit_journey/src/core/utils/app_assets.dart';
import 'package:fit_journey/src/core/utils/app_colors.dart';
import 'package:fit_journey/src/core/utils/app_fonts.dart';
import 'package:fit_journey/src/modules/cusotm_elements/custom_text.dart';
import 'package:fit_journey/src/modules/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();

    Timer(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Stack(
        children: [
          Center(
            child: FadeTransition(
              opacity: _animation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset(AppAssets.appLogo),
            
                
                  // Container(
                  //   width: 120.w, 
                  //   height: 120.h,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     image: DecorationImage(
                  //       image: AssetImage(AppAssets.appLogo), 
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 20.h), 
                  CustomText(text: "Welcome", fontSize: 24.sp,fontFamily: AppFonts.PoppinsBold,textColor: AppColors.grey,)
                
                ],
              ),
            ),
          ),
       
        ],
      ),
    );
  }
}