
import 'dart:io';

class ContactModel {

  String userName ;
  String email ;
  String phone ;
  final String imagePath;

  //File imageFile ;
 ContactModel ({
    required this.userName,
    required this.email,
    required this.phone,
   required this.imagePath,
    //required this.imageFile,

});


static  List<ContactModel> contacts = [];

  Map<String, dynamic> toMap() {
    return {
      'name': userName,
      'phone': phone,
     // 'image': imageFile,
      'email': email,
      'imagePath': imagePath,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      userName: map['name'],
      phone: map['phone'],
      email: map['email'],
     imagePath: map['imagePath'],
     // imageFile: map['image'],
    );


    }

    File get imageFile => File(imagePath);

}
