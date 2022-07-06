import 'package:demo_project/models/models.dart';
import 'package:demo_project/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: avoid_types_as_parameter_names
  void saveData(String list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('list', list);
  }

  void readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? saveData = prefs.getString("list");
    if (saveData != null) {
      newlist = saveData as List;
    }
  }

  var isLoaded = false;

  List newlist = [];

  @override
  void initState() {
    // getData();
    super.initState();
    getdata().then((da) {
      setState(() {
        isLoaded = true;
        da.forEach((key, value) {
          newlist.add(value);
        });

        print("NEWLIST");
        print(newlist);
      });
    });
  }

  // void _refreshJournals() async {
  //   final data = await SQLHelper.getItems();
  //   setState(() {
  //     print("get all data here");
  //     print(data);
  //     //_journals = data;
  //   });
  // }

  // newfunction(List _journals) async {
  //   for (var i = 0; i < _journals.length; i++) {
  //     Map<String, dynamic> data = {
  //       "icao": _journals[i]['icao'],
  //       "iata": _journals[i]['iata'],
  //       "name": _journals[i]['name'],
  //     };
  //     await SQLHelper.createItem("a", "b", "c");

  //     _refreshJournals();
  //   }
  // }

  // // Insert a new journal to the database
  // Future<void> _addItem() async {
  //   print("Inside Add Item");
  //   // await SQLHelper.createItem();
  //   // selectedgenderstatus,
  //   // rescontactController.text,
  //   // resoccController.text,
  //   // resrelController.text,
  //   // rescastnameController.text,
  //   // resreligionController.text,
  //   // noofresController.text,
  //   // landlengthController.text,
  //   // landwidthController.text,
  //   // landareaController.text,
  //   // selectedconstusage,
  //   // selectedconsttype,
  //   // constyearController.text,
  //   // houselengthController.text,
  //   // housewidthController.text,
  //   // houseareaController.text);
  //   // _refreshJournals();

  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text('Data inserted!'),
  //   ));
  // }

  getdata() async {
    var response = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/mwgg/Airports/master/airports.json"));
    var data = json.decode(response.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Screen"),
      ),
      body: SafeArea(
          child: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: newlist.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2,
                child: GestureDetector(
                  onTap: () {
                    // getCurrentLocation();
                    // saveData("list");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                newlist[index]['name'].toString(),
                                newlist[index]['icao'].toString(),
                                newlist[index]['city'].toString(),
                                newlist[index]['state'].toString(),
                                newlist[index]['country'].toString(),
                                newlist[index]['tz'].toString(),
                                newlist[index]['lat'].toString(),
                                newlist[index]['lon'].toString())));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(newlist[index]['name']),
                          Text(newlist[index]['icao'])
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(newlist[index]['city'] +
                              " ,  " +
                              newlist[index]['state']),
                          Text(newlist[index]['country'])
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        replacement: Center(child: CircularProgressIndicator()),
      )),
    );
  }
}
