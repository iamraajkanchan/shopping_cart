import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_cart/model/cart_item.dart';
import 'package:shopping_cart/shopping_item.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, List<CartItem>>(
      converter: (store) => store.state,
      builder: (context, list) {
        return ListView.builder(
          itemBuilder: (context, index) => ShoppingItem(
            item: list[index],
          ),
          itemCount: list.length,
        );
      },
    );
  }
}
