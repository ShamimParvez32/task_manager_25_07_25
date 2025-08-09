/*import 'package:flutter/material.dart';
import 'package:task_manager_16_07_25/ui/screens/sign_in_screen.dart';
import 'package:task_manager_16_07_25/ui/widgets/app_logo.dart';
import 'package:task_manager_16_07_25/ui/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
static const String name= '/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }


  Future<void> _moveToNextScreen()async{
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacementNamed(context, SignInScreen.name);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
            child: Center(
              child: AppLogo(),
            ),
          ),

      );

  }
}*/
/*

import 'package:flutter/material.dart';
import 'package:task_manager_16_07_25/ui/screens/sign_in_screen.dart';
import 'package:task_manager_16_07_25/ui/widgets/app_logo.dart';
import 'package:task_manager_16_07_25/ui/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name= '/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveToNextPage();

  }

  Future<void> moveToNextPage()async{
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacementNamed(context, SignInScreen.name);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: Center(
            child: AppLogo(
            ),
          )),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:task_manager_25_07_25/ui/controllers/auth_controller.dart';
import 'package:task_manager_25_07_25/ui/screens/main_bottom_nav_screen.dart';
import 'package:task_manager_25_07_25/ui/screens/sign_in_screen.dart';
import 'package:task_manager_25_07_25/ui/widgets/app_logo.dart';
import 'package:task_manager_25_07_25/ui/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name= '/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveToNextPage();
  }


  Future<void> moveToNextPage()async{
    await Future.delayed(const Duration(seconds: 1));
    bool isUserLoggedIn = await AuthController.isUserLoggedIn();
    if(isUserLoggedIn){
      Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
    }
    else{
      Navigator.pushReplacementNamed(context, SignInScreen.name);

    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: Center(child: AppLogo())),
    );
  }
}
