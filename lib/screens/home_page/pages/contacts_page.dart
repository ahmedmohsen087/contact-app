import 'package:contact_app/screens/home_page/widgets/contact_item.dart';
import 'package:flutter/material.dart';

import '../../../models/contact_model.dart';
import '../widgets/local_storge.dart';

class ContactsPage extends StatefulWidget {
  final VoidCallback onContactsChanged;

  const ContactsPage({
    required this.onContactsChanged,
    super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) => ContactItem(
            deleteContact: (int index) async {
              ContactModel.contacts.removeAt(index);
              await ContactsStorage.saveContacts();
              setState(() {
                widget.onContactsChanged();
              });
            },

              contactModel: ContactModel.contacts[index],
              index :index,
          ),itemCount: ContactModel.contacts.length
      )
    );
  }
}
