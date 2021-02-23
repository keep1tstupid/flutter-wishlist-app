import 'package:flutter/material.dart';
import 'package:flutter_project/pages/update_page.dart';
import '../material.dart';

class WishCard extends StatefulWidget {
  final Wish wish;
  final Function onDelete;
  WishCard(this.wish, this.onDelete);


  @override
  _WishCardState createState() => _WishCardState();
}

class _WishCardState extends State<WishCard> {

  List<Color> getColors(Wish wish) {
    if (wish.price == "0 - 100") {
        return [
          Colors.white,
          Colors.lightGreen.shade300,
        ];
    }
    if (wish.price == "100 - 500") {
        return [
          Colors.white,
          Colors.deepOrangeAccent.shade200,
        ];
      }
    if (wish.price == "500 - 1000") {
        return [
          Colors.white,
          Colors.greenAccent.shade200,
        ];
    }
    return [
      Colors.white,
      Colors.deepPurple.shade300,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
            children: <Widget>[
              Text(
                widget.wish.title + " & " + widget.wish.price,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                alignment: Alignment.centerRight,
                icon: Icon(Icons.edit),
                iconSize: 24.0,
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder:
                  (context) => UpdateWish(widget.wish))
                  );
                },
              ),
              IconButton(
                alignment: Alignment.centerRight,
                icon: Icon(Icons.delete),
                iconSize: 24.0,
                color: Colors.white,
                onPressed: () async {
                  Wish current = widget.wish;
                  String id = current.getId();
                  widget.onDelete(id);
                },
              ),
            ]
        ),
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: getColors(widget.wish),
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
