import 'package:contact_program/src/block/net_block.dart';
import 'package:contact_program/src/model/net_model.dart';
import 'package:flutter/material.dart';

class NetInfoScreen extends StatefulWidget {
  const NetInfoScreen({Key? key}) : super(key: key);

  @override
  State<NetInfoScreen> createState() => _NetInfoScreenState();
}

class _NetInfoScreenState extends State<NetInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<NetModel>>(
        stream: netBlock.getNetData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NetModel> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Center(
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      color: Colors.green,
                      child: const Icon(
                        Icons.done,
                        size: 24,
                      ),
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
