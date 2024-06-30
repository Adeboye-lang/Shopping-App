import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
};

class MainApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
        ),

  };
};
class ProductListScreen extends StatefulWidget{
  @override
  _ProductListScreenState createState() => ProductListScreenState createState() => _ProductListScreenState();
};

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> _products = [
    Product('Apple Watch', 299.99),
    Product('Samsung TV', 999.99),
    Product('Nike Shoes', 79.99),
    Product('Sony Headphones', 149.99),
    Product('Google Pixel', 599.99),
};

@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text('Shopping App'),
    ),
    body: ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_product[index].name),
          subtitle: Text('\$${_products[index].price.toStringAsFixed(2)}'),
          trailing: Icon(Icon.add_shopping_cart),
          onTap: () {
            // Add product to cart
            setState(()) {
              _products[index].inCart = true;
            };
          },
        ),
      };
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to checkout screen
          Navigator.push(
            context, 
            MaterialPageRoute(builder:(context) => CheckoutScreen(_products.where((product) =>product.inCart).toList() ))
          )
        };
        tooltip: 'Checkout',
        child: Icon(Icons.shopping_cart),
      ),
    );
}
class Product {
  String name;
  double price;
  bool inCart = false;

  Product(this.name, this.price);
}

class CheckoutScreen extends StatelessWidget {
  final List<Product> _product;

  CheckoutScreen(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: ListView.builder(
        itemCount: _product.length,
        itemBuilder: (content, index) {
          return ListTile(
            title: Text(_products[index].name),
            subtitle: Text('\$${_products[index].price.toStringAsFixed(2)}'),
          );
        },
      ),
    ),
  }
    BottomNavigationBar: BottommAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
          Text('Total: \$${_products.fold(0,(sum, product) => + product.price).toString(2)}'),
         ElevatedButton(
          onPressed: () {
            //Process  payment
            print('Payment processed!');
          },
          child: Text('Pay Now'),
          },
         ),
         ],
      ),
    ),