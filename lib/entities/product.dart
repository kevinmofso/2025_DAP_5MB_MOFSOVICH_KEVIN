class Product {
  String name;
  int ?price;
  Product({required this.name,  this.price});
  bool isFree() {
    return price == 0;
  }
}
