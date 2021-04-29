import 'package:flutter/cupertino.dart';

class CartItem {
  String name;
  bool isChecked;
  CartItem({@required this.name, @required this.isChecked});

  @override
  String toString() {
    return '$name : $isChecked';
  }
}
