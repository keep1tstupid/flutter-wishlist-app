
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
  _EditWishState createState() => _EditWishState(wish);

}

class _EditWishState extends State<EditWish> {
  Wish _wishState;
  _EditWishState(this._wishState);

  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  List<String> priorities = ["low", "medium", "high", ];
  List<String> prices = ["0 - 100", "100 - 500", "500 - 1000", "1000 + ", ];
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

    if (_wishState == null) {
      return Text('Loading...');
    }

    return Form(
      key: _formKey,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            initialValue: _wishState.title,
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
              _wishState.title = value;
            },
          ),
          DropdownButton<String> (
            hint: Text('Select priority'),
            value: _wishState.priority,
            onChanged: (String value) {
              setState(() {
                _wishState.priority = value;
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
            value: _wishState.price,
            onChanged: (String value) {
              setState(() {
                _wishState.price = value;
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
            initialValue: _wishState.link,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Enter a link...',
              labelText: 'https:// ... ',
            ),
            onChanged: (value) {
              _wishState.link = value;
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
                  (id: _wishState.id, title: _wishState.title, link: _wishState.link,
                    priority: _wishState.priority, price: _wishState.price);
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
