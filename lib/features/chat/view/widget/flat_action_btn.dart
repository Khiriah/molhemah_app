import 'package:flutter/material.dart';

class FlatActionButton extends StatelessWidget {
  final Icon? icon;
  final IconData? iconData;
  final Function() onPressed;
  const FlatActionButton(
      {this.icon,
      required this.onPressed,
      this.iconData,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: icon ??
            Icon(
              iconData ?? Icons.arrow_back,
            ),
      ),
    );
  }
}
