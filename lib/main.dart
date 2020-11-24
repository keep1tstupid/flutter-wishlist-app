import 'package:flutter/material.dart';
import 'package:flutter_project/pages/home_page.dart';

import 'material.dart';

// void main() => runApp(MyApp());

void main() {
  List<Wish> wishlist = new List<Wish>();

  runApp(MaterialApp(
    home: Home(wishlist),
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
    ),
  ));
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
