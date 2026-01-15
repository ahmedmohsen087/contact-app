import 'package:flutter/material.dart';

import '../../../core/theme/app_color.dart';

typedef CustomTextFieldCallback = String? Function (String vlue) ;
class TextFormItem extends StatelessWidget {

  final String hint ;

 final TextEditingController controller ;

 final CustomTextFieldCallback validator ;
 final TextInputType textInputType ;

   const TextFormItem({
    super.key,
    required this.controller,
    required this.hint,
    required this.validator,
    required this.textInputType,


  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10),
      child: TextFormField(
        keyboardType: textInputType ,
        validator: (value) => validator(value!),
        controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(
            color: AppColors.secondaryColor,
            fontSize: 16,

          ),
          decoration: InputDecoration(

            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 16,
              color: AppColors.formText,

            ),

            border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: AppColors.secondaryColor
              ),
              borderRadius: BorderRadius.circular(16),

            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: AppColors.secondaryColor
              ),
              borderRadius: BorderRadius.circular(16),


            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: AppColors.secondaryColor
              ),
              borderRadius: BorderRadius.circular(16),

            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: AppColors.secondaryColor
              ),
              borderRadius: BorderRadius.circular(16),

            ),
            errorBorder:OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: AppColors.red
              ),
              borderRadius: BorderRadius.circular(16),

            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: AppColors.red
              ),
              borderRadius: BorderRadius.circular(16),

            ),
          ),





      ),
    );
  }
}
