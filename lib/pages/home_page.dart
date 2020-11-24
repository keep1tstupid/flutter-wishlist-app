// home_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_project/pages/add_page.dart';
import 'package:flutter_project/widgets/wish_list.dart';
import '../material.dart';


class Home extends StatefulWidget {
  final List<Wish> wishlist;
  Home(this.wishlist);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Wish List'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.more_vert),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Center(
          child: widget.wishlist.isNotEmpty ? WishList(widget.wishlist) : Text("no wishes yet"),
      ),
      //ListOfWishes(widget.wishlist),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        height: 100,
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder:
                (context) => CreateNew(widget.wishlist))
            );
          },
          child: Text('ADD NEW'),
        ),
      ),
    );
  }
}
