import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/theme/app_color.dart';

class HomeEmptyPage extends StatelessWidget {
  const HomeEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/animations/not found.json'),
        Text('There is No Contacts Added Here',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryColor
          ),
        ),
      ],
    );
  }
}
