import 'package:flutter/material.dart';
import 'package:flutter_project/data_storage.dart';
import 'package:flutter_project/pages/home_page.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'material.dart';

// void main() => runApp(MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print(await getDatabasesPath());
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'wishlist.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE wish (id TEXT PRIMARY KEY, "
            "title TEXT, priority TEXT, price TEXT, link TEXT)",
      );
    },
    version: 1,
  );

  List<Wish> wishlist = await allWishes();

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
