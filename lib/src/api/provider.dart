//import 'dart:convert';
//
// import 'package:http/http.dart' as prep;
//
// class AppProvider {
//   static String baseUrl =
//       "https://api.osonapteka.uz/api/v1/history?lan=ru&region=21";
//
//   Future<List<NetModel>> getNetData() async {
//     String url = baseUrl;
//     prep.Response response = await prep.get(Uri.parse(url));
//     final netModel = netModelFromJson(utf8.decode(response.body.codeUnits));
//     return netModel;
//   }
// }
