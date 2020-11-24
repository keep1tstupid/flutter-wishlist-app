import 'package:flutter/material.dart';
import '../material.dart';

class WishCard extends StatefulWidget {
  final Wish wish;
  WishCard(this.wish);

  @override
  _WishCardState createState() => _WishCardState();
}

class _WishCardState extends State<WishCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Center(
          child: Text(widget.wish.title + " & " + widget.wish.price),
        ),
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.deepPurple.shade500,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            )
          ],
        ),
      ),
    );
  }
}
