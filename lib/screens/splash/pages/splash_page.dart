import 'package:contact_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../home_page/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  static  String routeName = 'splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if(mounted){
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return  Container(
      color: AppColors.primaryColor,

      child: Lottie.asset('assets/animations/Contact Us.json',
        fit: BoxFit.contain,

      ),

    );
  }
}
