
class Wish {
  String id;
  String title;
  String priority;
  String price;
  String link;

  // image?

  Wish({this.id, this.title, this.priority, this.price, this.link});

  void setPriority(String newPriority) {
    this.priority = newPriority;
  }

  void setPrice(String newPrice) {
    this.price = newPrice;
  }

  String getPrice() {
    return this.price;
  }

  String getId() {
    return this.id;
  }

  @override
  String toString() {
    return '"wish" : { "id" : $id, "title" : $title, '
        '"priority" : $priority, "price" : '
        '$price, "link" : $link}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'priority': priority,
      'price': price,
      'link': link,
    };
  }
}
