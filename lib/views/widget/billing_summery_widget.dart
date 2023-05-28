import 'package:flutter/material.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:provider/provider.dart';

class BillingSummeryWidget extends StatelessWidget {
  const BillingSummeryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ProductProvider productProvider, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Billing Summery",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'TiltNeon',
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 3),
            const Divider(),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text(
                  "Number Of Products",
                  style: TextStyle(
                      fontFamily: 'TiltNeon',
                      fontSize: 14,
                      color: Colors.grey
                  ),
                ),
                Text(
                  "${productProvider.selectedProduct.length}",
                  style: const TextStyle(
                      fontFamily: 'TiltNeon',
                      fontSize: 14,
                      color: Colors.grey
                  ),
                )
              ],
            ),
            const SizedBox(height: 3),
            const Divider(),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text(
                  "Sub Total",
                  style: TextStyle(
                      fontFamily: 'TiltNeon',
                      fontSize: 14,
                      color: Colors.grey
                  ),
                ),
                Text(
                  productProvider.total.toStringAsFixed(2),
                  style: const TextStyle(
                      fontFamily: 'TiltNeon',
                      fontSize: 14,
                      color: Colors.grey
                  ),
                )
              ],
            ),
            const SizedBox(height: 3),
            const Divider(),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Delivery Charges",
                  style: TextStyle(
                      fontFamily: 'TiltNeon',
                      fontSize: 14,
                      color: Colors.grey
                  ),
                ),
                Text(
                  "2.00",
                  style: TextStyle(
                      fontFamily: 'TiltNeon',
                      fontSize: 14,
                      color: Colors.grey
                  ),
                )
              ],
            ),
            const SizedBox(height: 3),
            const Divider(),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                      fontFamily: 'TiltNeon',
                      fontSize: 14,
                      color: Colors.grey
                  ),
                ),
                Text(
                  ((productProvider.total+2).toStringAsFixed(2)),
                  style: const TextStyle(
                      fontFamily: 'TiltNeon',
                      fontSize: 14,
                      color: Colors.grey
                  ),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}