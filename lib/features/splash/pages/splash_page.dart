import 'package:contact_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../home_page/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  static  String routeName = 'splash';
  static final Duration _duration = const Duration(seconds: 2);
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      //Navigator.pushReplacementNamed(context, BoardingModel.routeName);
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return  Stack(
      children: [
        Container(
          color: AppColors.primaryColor,
          height: size.height,
          width: size.width,
        ),
        Align(
          alignment: Alignment.center,
            child: Image(image: AssetImage(AppAssets.appIcon,
            ),
            height: 60,
              width: 180,
            )),
      ],
    );
  }
}
