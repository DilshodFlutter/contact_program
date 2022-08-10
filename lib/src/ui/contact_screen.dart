import 'package:contact_program/src/block/contact_block.dart';
import 'package:contact_program/src/model/contact_model.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerNumber = TextEditingController();
  TextEditingController controllerUpdateName = TextEditingController();
  TextEditingController controllerUpdateNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<ContactModel>>(
        stream: contactBlock.getContactData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ContactModel> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          data[index].name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data[index].number,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        GestureDetector(
                          onTap: () async {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 300,
                                    color: Colors.amber,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            child: ElevatedButton(
                                              onPressed: () => null,
                                              child: TextField(
                                                controller:
                                                    controllerUpdateNumber,
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText: "Name",
                                                        hintStyle: TextStyle(
                                                            color:
                                                                Colors.black)),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20.0),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            child: ElevatedButton(
                                              onPressed: () => null,
                                              child: TextField(
                                                controller:
                                                    controllerUpdateNumber,
                                                decoration:
                                                    const InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Number",
                                                  hintStyle: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          ElevatedButton(
                                            onPressed: () {
                                              data[index].number =
                                                  controllerUpdateNumber
                                                      as String;
                                              data[index].name =
                                                  controllerUpdateName
                                                      as String;
                                              contactBlock
                                                  .updateData(data[index]);
                                            },
                                            child: const Text("Edit"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text("Back"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            width: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blue),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 18.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        GestureDetector(
                          onTap: () async {
                            contactBlock.deleteData(data[index].id);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            width: 48,
                            decoration: (BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.red)),
                            child: const Center(
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 18.0,
                              ),
                            ),
                          ),
                        )
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
                          controller: controllerName,
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
                          controller: controllerNumber,
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
                            name: controllerName.text,
                            number: controllerNumber.text,
                          ));
                          controllerName.text = "";
                          controllerNumber.text = "";
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
        child: const Center(
          child: Icon(Icons.person_add_alt_1),
        ),
      ),
    );
  }
}
