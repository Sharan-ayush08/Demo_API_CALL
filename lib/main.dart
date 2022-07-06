import 'package:demo_project/provider/apiData.dart';
import 'package:demo_project/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DummyData());
}

class DummyData extends StatefulWidget {
  const DummyData({Key? key}) : super(key: key);

  @override
  State<DummyData> createState() => _DummyDataState();
}

class _DummyDataState extends State<DummyData> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataClass(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class LoadData extends StatefulWidget {
  const LoadData({Key? key}) : super(key: key);

  @override
  State<LoadData> createState() => _LoadDataState();
}

class _LoadDataState extends State<LoadData> {
  @override
  void initState() {
    super.initState();
    final apiData = Provider.of<DataClass>(context, listen: false);
    apiData.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    // final apiData = Provider.of<DataClass>(context);
    return HomePage();
  }
}
