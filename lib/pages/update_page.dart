import 'package:flutter/material.dart';
import 'package:flutter_project/data_storage.dart';
import 'package:flutter_project/widgets/wish_add_form.dart';
import 'package:flutter_project/pages/home_page.dart';
import 'package:flutter_project/widgets/wish_update_form.dart';

import '../material.dart';


class UpdateWish extends StatefulWidget {
  final Wish wish;
  UpdateWish(this.wish);

  @override
  _UpdateWishState createState() => _UpdateWishState();
}

class _UpdateWishState extends State<UpdateWish> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update your Wish'),
        leading: IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () async {
            List<Wish> wishlist = await allWishes();
            Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => Home(wishlist))
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: EditWish(widget.wish),
      ),
    );
  }
}
