import 'package:flutter/material.dart';

class WithNotification extends StatelessWidget {
  const WithNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Positioned(
            child: Icon(
              Icons.shopping_cart_sharp,
            )),
        Positioned(
            right: 0,
            top: 0,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 4,
            ))
      ],
    );
  }
}