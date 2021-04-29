import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_cart/model/cart_item.dart';
import 'package:shopping_cart/redux/actions.dart';

class ShoppingItem extends StatefulWidget {
  final CartItem item;
  ShoppingItem({Key key, this.item}) : super(key: key);
  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, OnItemDeleted>(
      converter: (store) =>
          (item) => store.dispatch(DeleteItemAction(widget.item)),
      builder: (context, callback) {
        return Dismissible(
          key: Key(widget.item.name),
          onDismissed: (_) {
            setState(() {
              callback(widget.item);
            });
          },
          child: StoreConnector<List<CartItem>, OnToggleStateAction>(
            converter: (store) =>
                (item) => store.dispatch(ToggleStateItemAction(widget.item)),
            builder: (context, callback) {
              return ListTile(
                title: Text(widget.item.name),
                leading: Checkbox(
                  value: widget.item.isChecked,
                  onChanged: (value) {
                    setState(() {
                      callback(
                          CartItem(name: widget.item.name, isChecked: value));
                    });
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      callback(widget.item);
                    });
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

typedef OnToggleStateAction = Function(CartItem item);
typedef OnItemDeleted = Function(CartItem item);
