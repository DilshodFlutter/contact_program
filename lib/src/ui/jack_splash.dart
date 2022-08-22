import 'package:contact_program/src/ui/jack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class JackSplash extends StatefulWidget {
  const JackSplash({Key? key}) : super(key: key);

  @override
  State<JackSplash> createState() => _JackSplashState();
}

class _JackSplashState extends State<JackSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Slidable(
            key: const ValueKey(
              0,
            ),
            startActionPane: ActionPane(motion: ScrollMotion(), children: [
              SlidableAction(
                onPressed: bosMa,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'delete',
              )
            ]),
            endActionPane: const ActionPane(
              motion: ScrollMotion(),
              key: ValueKey(
                1,
              ),
              children: [
                SlidableAction(
                  flex: 2,
                  onPressed: doNothing,
                  backgroundColor: Color(0xFF0392CF),
                  foregroundColor: Colors.white,
                  icon: Icons.save,
                  label: 'Save',
                ),
              ],
            ),
            child: const ListTile(
              title: Center(child: Text("aksajnandw")),
            ),
          ),
        ],
      ),
    );
  }

  void bosMa(BuildContext context) {}
}
