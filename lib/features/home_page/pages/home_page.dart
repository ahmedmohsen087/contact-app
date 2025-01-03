import 'package:contact_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../widgets/bottom_sheet.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Image(image: AssetImage(AppAssets.appIcon,
              ),
                height: 39,
                width: 117,
              )),
          Align(
              alignment: Alignment.center,
              child: Image(image: AssetImage(AppAssets.homePg,
              ),
                height: 368,
                width: 368,
              )),
          Text('There is No Contacts Added Here',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryColor
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              right: 10
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: (){
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context){
                        return BottomSheetItem();
                      }
                  );
                },
                backgroundColor: AppColors.secondaryColor,
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
