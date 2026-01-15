import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/Contact_model.dart';

class ContactsStorage {
  static const _key = 'contacts';

  static Future<void> saveContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final data = ContactModel.contacts
        .map((e) => e.toMap())
        .toList();
    prefs.setString(_key, jsonEncode(data));
  }

  static Future<void> loadContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);

    if (jsonString == null) return;

    final List decoded = jsonDecode(jsonString);
    ContactModel.contacts =
        decoded.map((e) => ContactModel.fromMap(e)).toList();
  }
}
