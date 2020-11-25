import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';


// Define a function that inserts wishes into the database
Future<void> insertWish(Wish wish) async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'wishlist.db'),
  );
  // Get a reference to the database.
  final Database db = await database;

  print(getDatabasesPath());

  await db.insert(
    'wish',
    wish.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Wish>> allWishes() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'wishlist.db'),
  );

  // Get a reference to the database.
  final Database db = await database;

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('wish');

  // Convert the List<Map<String, dynamic> into a List<Wish>.
  return List.generate(maps.length, (i) {
    return Wish(
      //id: maps[i]['id'],
      title: maps[i]['title'],
      priority: maps[i]['priority'],
      price: maps[i]['price'],
      link: maps[i]['link'],
    );
  });
}

Future<void> updateWish(Wish wish) async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'wishlist.db'),
  );

  // Get a reference to the database.
  final db = await database;

  // Update the given Dog.
  await db.update(
    'wish',
    wish.toMap(),
    // Ensure that the wish has a matching id.
    where: "id = ?",
    // Pass the wish's id as a whereArg to prevent SQL injection.
    whereArgs: [wish.id],
  );
}

Future<void> deleteWish(String id) async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'wishlist.db'),
  );

  // Get a reference to the database.
  final db = await database;

  // Remove the wish from the database.
  await db.delete(
    'wish',
    // Use a `where` clause to delete a specific wish.
    where: "id = ?",
    // Pass the wish's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}
