import 'package:contact_app/core/theme/app_color.dart';
import 'package:contact_app/features/home_page/widgets/text_form_item.dart';
import 'package:flutter/material.dart';

class BottomSheetItem extends StatefulWidget {
  const BottomSheetItem({super.key});

  @override
  State<BottomSheetItem> createState() => _BottomSheetItemState();
}
class _BottomSheetItemState extends State<BottomSheetItem> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    String name = "";
    String email = "";
    String phone = "";

    var size = MediaQuery.of(context).size;
    return  Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40)),
      ),
      //height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 10,
                left: 10,
                top: 10
              ),
              child: Row(
                children: [
                  Container(
                    width: 143,
                    height: 146,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.secondaryColor,)
                    ),
                    child: Icon(Icons.image,),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(name,
                          style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.secondaryColor,
                        )),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Divider(
                            color: AppColors.secondaryColor,
                            thickness: 1,

                          ),
                        ),
                        Text(email,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.secondaryColor
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Divider(
                            color: AppColors.secondaryColor,
                            thickness: 1,

                          ),
                        ),
                        Text(phone,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.secondaryColor
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Divider(
                            color: AppColors.secondaryColor,
                            thickness: 1,

                          ),
                        ),

                    ]),
                  )
                ],
              ),
            ),
            TextFormItem(
                controller: nameController,
                text: 'Name',
                textInputType : TextInputType.name,
            ),
            TextFormItem(
              controller: emailController,
                text: 'Email',
                textInputType : TextInputType.emailAddress
            ),
            TextFormItem(
              controller: phoneController,
             text: 'Phone',
             textInputType : TextInputType.phone
           ),
            Padding(
              padding: const EdgeInsets.only(right: 10,left: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder
                    (borderRadius: BorderRadius.circular(16))),
                  backgroundColor: WidgetStatePropertyAll(AppColors.secondaryColor),
                  minimumSize: WidgetStatePropertyAll(Size(size.width, 59.62)),
                ),
                  onPressed: (){
                    setState(() {
                      name = nameController.text;
                      email = emailController.text;
                      phone = phoneController.text;
                    });
                  },
                  child: Text('Enter user',
                    style: TextStyle(
                      color: AppColors.textColor
                    ),
                  )),
            )

          ],
        ),
      ),
    );
  }
}
