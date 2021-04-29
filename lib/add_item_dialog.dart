import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_cart/model/cart_item.dart';
import 'package:shopping_cart/redux/actions.dart';

class AddItemDialog extends StatefulWidget {
  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  String itemName;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, OnItemAddedCallBack>(
      converter: (store) => (itemName) => store
          .dispatch(AddItemAction(CartItem(name: itemName, isChecked: false))),
      builder: (context, callback) {
        return AlertDialog(
          title: Text('Add Item'),
          contentPadding: EdgeInsets.all(16.0),
          content: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'Item Name', hintText: 'Eg. iPhone'),
                  onChanged: (value) {
                    setState(() {
                      itemName = value;
                    });
                  },
                ),
              )
            ],
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            MaterialButton(
              onPressed: () {
                callback(itemName);
                Navigator.of(context).pop();
              },
              child: Text('Add Item'),
            ),
          ],
        );
      },
    );
  }
}

typedef OnItemAddedCallBack = Function(String itemName);
