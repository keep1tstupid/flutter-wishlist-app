
class Wish {
  String title;
  String priority;
  String price;
  String link;

  // image?

  Wish({ this.title, this.priority, this.price, this.link, });

  void setPriority(String newPriority) {
    this.priority = newPriority;
  }

  void setPrice(String newPrice) {
    this.price = newPrice;
  }
}
