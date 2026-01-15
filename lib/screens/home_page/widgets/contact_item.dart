import 'package:contact_app/core/theme/app_color.dart';
import 'package:contact_app/models/Contact_model.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final ContactModel contactModel ;
  
final int index ;
final Function deleteContact ;
  const ContactItem({
    required this.deleteContact ,
    super.key,
    required this.index,
    required this.contactModel
  });
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.secondaryColor,
      ) ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Stack(
            alignment: AlignmentGeometry.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(8),
                  child: Image.file(contactModel.imageFile,
                  )),
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.secondaryColor
                ) ,
                  child: Text(contactModel.userName,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.email),
                    Text (contactModel.email,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.phone_bluetooth_speaker_outlined),
                    Text (contactModel.phone,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red
                    ),
                    onPressed: (){
                      deleteContact(index);

                    }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete,
                      color: AppColors.white,
                    ),
                    Text('Delete',
                      style: TextStyle(
                        color:AppColors.white,
                      ),

                    )
                  ],
                )),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

