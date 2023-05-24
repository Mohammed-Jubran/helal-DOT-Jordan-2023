import 'package:flutter/material.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:provider/provider.dart';

class WithNotification extends StatelessWidget {
  const WithNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ProductProvider productProvider, child) => Stack(
              children: [
                const Positioned(
                    child: Icon(
                  Icons.shopping_cart_sharp,
                )),
                Positioned(
                  left: 10,
                  bottom: 9,
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Text(
                      "${productProvider.selectedProduct.length}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11),
                    ),
                  ),
                )
              ],
            ));
  }
}
