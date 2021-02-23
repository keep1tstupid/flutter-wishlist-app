import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/wish_card.dart';
import '../data_storage.dart';
import '../material.dart';

class WishList extends StatefulWidget {
  final List<Wish> wishlist;
  WishList(this.wishlist);

  @override
  _WishListState createState() => _WishListState(wishlist);
}

class _WishListState extends State<WishList> {
  List<Wish> _wishlist;
  _WishListState(this._wishlist);

  onItemDelete(String id) async {
    await deleteWish(id);
    List<Wish> newWishes = await allWishes();
    setState(() {
      _wishlist = newWishes;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                  children: _wishlist.map((wish) {
                    print(wish.toString());
                    return WishCard(wish, (String id) {
                      this.onItemDelete(id);
                    });
              }).toList()),
            ],
          ),
        ),
      ),
    );
  }
}
