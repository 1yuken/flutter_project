import 'package:flutter/material.dart';
import 'package:flutter_project/ui/widgets/empty_wrapper.dart';
import '../../data/app_data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  var cartFood = AppData.cartItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: EmptyWrapper(
        title: "Empty cart",
        isEmpty: cartFood.isEmpty,
        child: _cartListView(),
      ),
      bottomNavigationBar: _bottomAppBar(),
    );
  }
    PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Cart screen",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget _cartListView() {
  return ListView.separated(
    padding: const EdgeInsets.all(30),
    itemCount: 20,
    itemBuilder: (_, index) {
      return Container(
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Text(
          '${index + 1}',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );
    },
    separatorBuilder: (_, __) => Container(
      height: 20,
    ),
  );
}

  Widget _bottomAppBar() {
    return BottomAppBar(
        child: SizedBox(
            height: 300,
            child: Container(
              color: Colors.white,
            )));
  }

}
