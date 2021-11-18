import 'package:flutter/material.dart';
import 'package:parcial_flugoomaps/app/ui/pages/home/home_page.dart';

void main() {
  runApp(const ParcialAppMaps());
}

class ParcialAppMaps extends StatelessWidget {
  const ParcialAppMaps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Maps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
