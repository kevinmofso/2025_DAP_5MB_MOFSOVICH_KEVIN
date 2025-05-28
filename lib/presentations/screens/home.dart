import 'package:flutter/material.dart';
import 'package:myapp/entities/product.dart';

class HomeScreen extends StatefulWidget {
  final String usuario;

  const HomeScreen({super.key, required this.usuario});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Product myProduct = Product(name: "iphone", price: 1200);
  Product my2product = Product(name: "samsung", price: 0);
  List<Product> products = [];

  /*
  @override
  void initState() {
    super.initState();
    print("product name is ${myProduct.name}");
    print("product price is ${myProduct.price}");
    if (myProduct.isFree()) {
      print("product is free");
    } else {
      print("product is not free");
    }
    products.add(Product(name: "lapiz",price: 100));
    for (var product in products) {
      print("product name is ${product.name}");
      print("product price is ${product.price}");
    }
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Accede a la propiedad 'usuario' del StatefulWidget a través de 'widget'
        child: Text("Hola ${widget.usuario}"),
      ),
    );
  }
}

// El build que tenías aquí fuera no es necesario y debe ser eliminado.
// Widget build(BuildContext context) {
//   return const Scaffold(
//     body: Center(
//       child: Text("Hola $usuario"),
//     ),
//   );
// }
