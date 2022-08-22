import 'dart:developer';

import 'package:contact_program/src/block/contact_block.dart';
import 'package:contact_program/src/model/contact_model.dart';
import 'package:contact_program/src/ui/jack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextEditingController _controllerNumbers = TextEditingController();
  TextEditingController _controllerNames = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
                    height: 450,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.0),
                        topLeft: Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () => null,
                          child: SizedBox(
                            height: 60,
                            //  padding: EdgeInsets.all(15.0),
                            width: MediaQuery.of(context).size.width - 80,
                            child: TextField(
                              controller: _controllerNames,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Name",
                                  hintStyle: TextStyle(color: Colors.black45)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () => null,
                          child: SizedBox(
                            height: 60,
                            //  padding: EdgeInsets.all(15.0),
                            width: MediaQuery.of(context).size.width - 80,
                            child: TextField(
                              controller: _controllerNumbers,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Number",
                                  hintStyle: TextStyle(color: Colors.black45)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Align(
                          alignment: const FractionalOffset(0.94, 0.1),
                          child: ElevatedButton(
                            onPressed: () async {
                              contactBlock.saveData(ContactModel(
                                name: _controllerNames.text,
                                number: _controllerNumbers.text,
                              ));
                              _controllerNames.text = "";
                              _controllerNumbers.text = "";
                              Navigator.pop(this.context);
                            },
                            child: const SizedBox(
                              height: 40.0,
                              width: 40.0,
                              child: Center(
                                child: Icon(
                                  Icons.done,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                backgroundColor: Colors.transparent,
              );
            },
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
                return Slidable(
                  key: const ValueKey(
                    0,
                  ),
                  startActionPane:  ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: doNothing,
                        backgroundColor: Color(0xFF0392CF),
                        foregroundColor: Colors.white,
                        icon: Icons.save,
                        label: 'Save',
                      )
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          contactBlock.deleteData(data[index].id);
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'delete',
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 20.0),
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.green,
                    ),
                    child: Column(
                      children: [
                        Row(
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
                      ],
                    ),
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
