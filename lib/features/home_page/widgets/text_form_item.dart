import 'package:flutter/material.dart';

import '../../../core/theme/app_color.dart';

class TextFormItem extends StatelessWidget {
  String text ;
  TextFormItem({
    super.key,
    required this.text,
    required TextInputType textInputType, required TextEditingController controller});
   TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10),
      child: TextFormField(

        controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter user $text',
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
          )

      ),
    );
  }
}
