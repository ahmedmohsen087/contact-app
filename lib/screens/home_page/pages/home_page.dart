

import 'package:contact_app/core/theme/app_color.dart';
import 'package:contact_app/screens/home_page/pages/contacts_page.dart';
import 'package:flutter/material.dart';

import '../../../models/contact_model.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/local_storge.dart';
import 'home_empty_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home';
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    await ContactsStorage.loadContacts();
    if (mounted) setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(
          children: [
            ContactModel.contacts.isEmpty?
            HomeEmptyPage():
            ContactsPage(
              onContactsChanged: () {
                setState(() {});
              },
            ),

          ],

        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Visibility(
              visible: ContactModel.contacts.isNotEmpty,
              child: FloatingActionButton(
                onPressed: (){
                },
                backgroundColor: AppColors.red,
                foregroundColor: AppColors.white,
                child: Icon(Icons.delete,
                ),
              ),
            ),
            SizedBox(height: 10,),
            FloatingActionButton(
              onPressed: () async {
                await showModalBottomSheet (
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context){
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: BottomSheetItem(),
                      );
                    }
                );
                if (mounted) {
                  setState(() {});
                }

              },
              backgroundColor: AppColors.secondaryColor,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
