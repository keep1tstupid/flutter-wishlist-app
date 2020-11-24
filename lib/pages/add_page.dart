import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/wish_add_form.dart';
import 'package:flutter_project/pages/home_page.dart';

import '../material.dart';

class CreateNew extends StatefulWidget {
  final List<Wish> wishlist;
  CreateNew(this.wishlist);

  @override
  CreateNewState createState() {
    return CreateNewState();
  }
}

class CreateNewState extends State<CreateNew> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Wish'),
        leading: IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => Home(widget.wishlist))
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AddWish(widget.wishlist),
      ),
    );
  }
}
