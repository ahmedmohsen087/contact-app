import 'dart:io';

import 'package:contact_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/theme/app_color.dart';

class InputCard extends StatelessWidget {

  final TextEditingController nameController ;
  final TextEditingController phoneController ;
  final TextEditingController emailController ;
  final File? image ;
  final Function onClick ;

   const InputCard({
     required this.nameController ,
     required this.phoneController ,
     required this.emailController ,
     this.image,
     required this.onClick ,
     super.key
   });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            onClick() ;
          },
          child: Container(
            width: 143,
            height: 146,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.secondaryColor,)
            ),
            child: image==null ?
            Lottie.asset('assets/animations/Gallery Loader.json'):
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(image!,
                    fit: BoxFit.cover,
                  ),
                )
            ,

          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10
            ),
            child: Column(

                children: [
                  ValueListenableBuilder(
                      valueListenable: nameController,
                      builder: (context, value, child) =>
                          Text(value.text.isEmpty?AppConstants.userName:
                              value.text
                              ,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.secondaryColor,
                              )),
                  ),
                  Divider(
                    color: AppColors.secondaryColor,
                    thickness: 1,

                  ),
                  ValueListenableBuilder(
                    valueListenable: emailController,
                    builder: (context, value, child) =>
                        Text(value.text.isEmpty?AppConstants.email:
                        value.text
                            ,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondaryColor,
                            )),
                  ),
                  Divider(
                    color: AppColors.secondaryColor,
                    thickness: 1,

                  ),
                  ValueListenableBuilder(
                    valueListenable: phoneController,
                    builder: (context, value, child) =>
                        Text(value.text.isEmpty?AppConstants.phoneNumber:
                        value.text
                            ,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondaryColor,
                            )),
                  ),
                  Divider(
                    color: AppColors.secondaryColor,
                    thickness: 1,

                  ),

                ]),
          ),
        )
      ],
    );
  }
}
