import 'package:contact_program/src/database_helper/database_helper.dart';
import 'package:contact_program/src/model/contact_model.dart';
import 'package:rxdart/subjects.dart';

class ContactBlock {
  DatabaseHelper databaseHelper = DatabaseHelper();

  final _fetchData = PublishSubject<List<ContactModel>>();

  Stream<List<ContactModel>> get getContactData => _fetchData.stream;

  allContact() async {
    List<ContactModel> data = await databaseHelper.getData();
    _fetchData.sink.add(data);
  }

  Future<int> saveData(ContactModel item) async {
    int id = await databaseHelper.saveData(item);
    allContact();
    return id;
  }

  Future<int> deleteData(int data) async {
    int id = await databaseHelper.deleteData(data);
    allContact();
    return id;
  }

  Future<int> updateData(ContactModel products) async {
    int id = await databaseHelper.saveData(products);
    allContact();
    return id;
  }
}

final contactBlock = ContactBlock();
