import 'dart:convert';

import 'package:contact_program/src/model/net_model.dart' as info;
import 'package:http/http.dart' as prep;

class AppProvider {
  static String baseUrl =
      "https://api.osonapteka.uz/api/v1/history?lan=ru&region=21";

  Future<List<info.NetModel>> getNetData() async {
    String url = baseUrl;
    prep.Response response = await prep.get(Uri.parse(url));
    final netModel = info.netModelFromJson(utf8.decode(response.body.codeUnits));
    return netModel;
  }
}
