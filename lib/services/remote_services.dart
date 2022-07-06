// import 'dart:convert';

// import 'package:demo_project/models/models.dart';
// import 'package:http/http.dart' as http;

// class Services {
//   Future<Map<String, Post>?> getPosts() async {
//     print("INSIDE GET POST");
//     var client = http.Client();
//     var url = Uri.parse(
//         "https://raw.githubusercontent.com/mwgg/Airports/master/airports.json");

//     var response = await http.get(url);

//     print("RESPONSE");
//     print(response.body);
//     // var response = await client.get(url);
//     try {
//       if (response.statusCode == 200) {
//         var json1 = json.decode(response.body);

//         print("parse");

//         return postFromJson(json1);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
