
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project/pages/home_page.dart';
import 'package:image_picker/image_picker.dart';

import '../data_storage.dart';
import '../material.dart';

class EditWish extends StatefulWidget {
  final Wish wish;
  EditWish(this.wish);

  @override
  _EditWishState createState() => _EditWishState();
}

class _EditWishState extends State<EditWish> {
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  List<String> priorities = ["low", "medium", "high", ];
  List<String> prices = ["0 - 100", "100 - 500", "500 - 1000", "1000 + ", ];
  String title;
  String priority;
  String price;
  String link;
  File _image;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    title = widget.wish.title;
    priority = widget.wish.priority;
    price = widget.wish.price;
    link = widget.wish.link;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            initialValue: title,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Title',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter the title';
              }
              return null;
            },
            onChanged: (value) {
              title = value;
            },
          ),
          DropdownButton<String> (
            hint: Text('Select priority'),
            value: priority,
            onChanged: (String value) {
              setState(() {
                priority = value;
              });
            },
            items: priorities.map((String priority) {
              return  DropdownMenuItem<String>(
                value: priority,
                child: Row(
                  children: <Widget>[
                    Text(
                      priority,
                      style:  TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          DropdownButton<String> (
            hint: Text('Select price category'),
            value: price,
            onChanged: (String value) {
              setState(() {
                price = value;
              });
            },
            items: prices.map((String price) {
              return  DropdownMenuItem<String>(
                value: price,
                child: Row(
                  children: <Widget>[
                    Text(
                      price,
                      style:  TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          TextFormField(
            initialValue: link,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Enter a link...',
              labelText: 'https:// ... ',
            ),
            onChanged: (value) {
              link = value;
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: FloatingActionButton(
              onPressed: getImage,
              tooltip: 'Pick Image',
              child: Icon(Icons.add_a_photo),
              backgroundColor: Colors.grey,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            height: 100,
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () async {
                Wish updWish = new Wish
                  (id: widget.wish.id, title: title, link: link,
                    priority: priority, price: price);
                updateWish(updWish);
                List<Wish> upd = await allWishes();
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => Home(upd)
                    )
                );
              },
              child: Text('UPDATE MY WISH'),
            ),
          ),
        ],
      ),
    );
  }
}
