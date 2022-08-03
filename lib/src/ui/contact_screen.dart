import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            height: 80,
              padding: EdgeInsets.all(25.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40.0) , color: Colors.red),
              child: Text("Touch"))),
    );
  }
}
