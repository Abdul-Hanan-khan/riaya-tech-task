
import 'package:fit_journey/src/modules/welcome/welcome_screen.dart';
import 'package:fit_journey/src/modules/workout/provider/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'src/core/services/message_service.dart';


void main() {
  runApp(const CogeterApp());
}

class CogeterApp extends StatelessWidget {
  const CogeterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WorkoutProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fit Journey',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          scaffoldMessengerKey:
              MessageService.messengerKey, // Attach the messenger key
          home: WelcomeScreen(),
          // home: TestClass(),
        ),
      ),
    );
  }
}
