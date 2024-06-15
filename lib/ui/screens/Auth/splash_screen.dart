import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/screens/Auth/sign_in_screen.dart';

import 'package:task_manager/ui/utility/assets_path.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    _moveToNextScreen();
    super.initState();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    if (mounted) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(

        child:  Center(child: SvgPicture.asset(AssetsPath.applogosvg)),)


    );
  }
}
