import 'package:contact_program/src/block/contact_block.dart';
import 'package:contact_program/src/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.person_add_alt_1,
              size: 30.0,
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            width: 30.0,
          ),
        ],
      ),
      body: StreamBuilder<List<ContactModel>>(
        stream: contactBlock.getContactData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ContactModel> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.green,
                  ),
                  child: Column(
                    children: [
                      Slidable(
                        key: const ValueKey(
                          0,
                        ),


                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                data[index].name,
                              ),
                            ),
                            Text(
                              data[index].number,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
