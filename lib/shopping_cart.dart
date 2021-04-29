import 'package:flutter/material.dart';
import 'package:shopping_cart/add_item_dialog.dart';
import 'package:shopping_cart/shopping_list.dart';
import 'package:shopping_cart/model/cart_item.dart';
import 'package:redux/redux.dart';

class ShoppingCart extends StatelessWidget {
  final Store<List<CartItem>> store;
  const ShoppingCart({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ShoppingList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddItemDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

_openAddItemDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => AddItemDialog());
}
