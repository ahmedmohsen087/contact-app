import 'dart:io';
import 'package:contact_app/core/theme/app_color.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/screens/home_page/widgets/input_card.dart';
import 'package:contact_app/screens/home_page/widgets/text_form_item.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constants/app_constants.dart';
import 'local_storge.dart';

class BottomSheetItem extends StatefulWidget {
 const  BottomSheetItem({super.key});

  @override
  State<BottomSheetItem> createState() => _BottomSheetItemState();

}
class _BottomSheetItemState extends State<BottomSheetItem> {
  final  nameController = TextEditingController();
  final  emailController = TextEditingController();
  final  phoneController = TextEditingController();
  File? image ;
  final formKey = GlobalKey<FormState>() ;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Form(
      key: formKey,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputCard(
                emailController:emailController ,
                nameController:nameController ,
                phoneController: phoneController,
                image: image ,
                onClick: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? pickedImage =
                  await picker.pickImage(source: ImageSource.gallery);

                  if (pickedImage != null) {
                    setState(() {
                      image = File(pickedImage.path);
                    });
                  }

                },

              ),
              TextFormItem(
                validator: (value) => value.isEmpty ? 'Enter Your Name':null,
                controller:nameController ,
                hint: AppConstants.enterName,
                textInputType: TextInputType.name,
              ),

              TextFormItem(
                validator: emailValidator ,
                controller:emailController ,
                hint: AppConstants.enterMail,
                textInputType: TextInputType.emailAddress,

              ),

              TextFormItem(
                validator: phoneValidator,
                controller:phoneController ,
                hint: AppConstants.enterPhone,
                textInputType: TextInputType.phone,

              ),

              ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder
                      (borderRadius: BorderRadius.circular(16))),
                    backgroundColor: WidgetStatePropertyAll(AppColors.secondaryColor),
                    minimumSize: WidgetStatePropertyAll(Size(size.width, 59.62)),
                  ),

                  onPressed: () async {
                    if(formKey.currentState!.validate()){
                      if(image==null){
                        return ;
                      }
                      ContactModel.contacts.add(
                        ContactModel(
                            userName: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            imagePath: image!.path),

                      );
                      Navigator.pop(context);
                      await ContactsStorage.saveContacts();

                    }

                  },
                  child: Text('Enter user',
                    style: TextStyle(
                        color: AppColors.primaryColor
                    ),
                  )),
              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }


  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Your Email';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null;
  }
  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Your Phone';
    }

    final phoneRegex = RegExp(
      r'^(00201|\\+201|01)[0-2,5]{1}[0-9]{8}$',
    );

    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone';
    }

    return null;
  }

}
