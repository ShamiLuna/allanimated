import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listeffect/shriktoplist.dart';
// import 'shrink_top_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shrink Top List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShrinkTopListPage(),
    );
  }
}
