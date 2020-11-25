import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/wish_card.dart';
import '../material.dart';

class WishList extends StatefulWidget {
  final List<Wish> wishlist;
  WishList(this.wishlist);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                  children: widget.wishlist.map((wish) {
                    return WishCard(wish);
              }).toList()),
            ],
          ),
        ),
      ),
    );
  }
}
