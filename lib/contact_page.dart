import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:smart_helmet/welcome.dart';

class ContactScreen extends StatefulWidget {
  static const String id = 'ContactScreen';
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFd8e8e8),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 1,
            left: -50,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF08f4dc).withOpacity(0.35),
                backgroundBlendMode: BlendMode.srcOver,
              ),
            ),
          ),
          Positioned(
            top: -50,
            left: 50,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF08f4dc).withOpacity(0.35),
                backgroundBlendMode: BlendMode.srcOver,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 430,
              height: MediaQuery.of(context).size.height * 0.77,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.black,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Text(
                          "Emergency Contacts",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48),
                          ),
                        ),
                        onPressed: () async {
                          // Request contact permission
                          if (await FlutterContacts.requestPermission()) {
                            // Get all contacts (fully fetched)
                            List<Contact> contacts =
                                await FlutterContacts.getContacts(
                                    withProperties: true, withPhoto: true);

                            // Get contact with specific ID (fully fetched)
                            Contact? contact = await FlutterContacts.getContact(
                                contacts.first.id);

                            print(contacts);
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Text(
                            "ADD NEW",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
