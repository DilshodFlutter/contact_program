import 'package:contact_program/src/database_helper/database_helper_new.dart';
import 'package:contact_program/src/model/net_model.dart';
import 'package:rxdart/subjects.dart';

class NetBlock {
  DatabaseHelperNew databaseHelper = DatabaseHelperNew();

  final _fetchNetData = PublishSubject<List<NetModel>>();

  Stream<List<NetModel>> get getNetData => _fetchNetData.stream;

  allNetInfo() async {
    List<NetModel> data = await databaseHelper.getData();
    _fetchNetData.sink.add(data);
  }

  Future<int> saveData(NetModel update) async {
    int id = await databaseHelper.saveData(update);
    allNetInfo();
    return id;
  }

  Future<int> updateData(NetModel products) async {
    int id = await databaseHelper.updateData(products);
    allNetInfo();
    return id;
  }

  Future<int> deleteData(int delete) async {
    int id = await databaseHelper.deleteData(delete);
    allNetInfo();
    return id;
  }
}

final netBlock = NetBlock();
