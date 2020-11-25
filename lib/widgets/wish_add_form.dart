import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_project/material.dart';
import 'package:flutter_project/pages/home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../data_storage.dart';

// Create a Form widget.
class AddWish extends StatefulWidget {
  final List<Wish> wishlist;
  AddWish(this.wishlist);

  @override
  AddWishState createState() {
    return AddWishState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class AddWishState extends State<AddWish> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  File _image;
  final picker = ImagePicker();

  List<String> priorities = ["low", "medium", "high", ];
  String selectedPriority;

  List<String> prices = ["0 - 100", "100 - 500", "500 - 1000", "1000 + ", ];
  String selectedPrice;

  String title;
  String link;

  var uuid = Uuid();
  //List<Wish> updatedList;



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
    // Build a Form widget using the _formKey created above.


    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              hintText: 'Enter a title...',
              labelText: 'Title',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter the title';
              }
              return null;
            },
            //onSaved: (value) => setState(() => newWish.title = value),
            onChanged: (value) {
              title = value;
            },
          ),
          DropdownButton<String> (
            hint: Text('Select priority'),
            value: selectedPriority,
            onChanged: (String priority) {
              setState(() {
                selectedPriority = priority;
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
            value: selectedPrice,
            onChanged: (String price) {
              setState(() {
                selectedPrice = price;
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
            decoration: InputDecoration(
              filled: true,
              hintText: 'Enter a link...',
              labelText: 'https:// ... ',
            ),
            //onSaved: (value) => setState(() => newWish.link = value),
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
                // newWish.setPriority(selectedPriority);
                // newWish.setPrice(selectedPrice);
                Wish newWish = new Wish
                  (id: uuid.v4(), title: title, link: link,
                    priority: selectedPriority, price: selectedPrice);
                insertWish(newWish);
                print(newWish.toString());
                List<Wish> upd = await allWishes();
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => Home(upd)
                    )
                );
              },
              child: Text('SAVE MY WISH'),
            ),
          ),
        ],
      ),
    );
  }
}
