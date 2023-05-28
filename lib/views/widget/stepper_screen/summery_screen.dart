import 'package:flutter/material.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:helal/views/widget/billing_summery_widget.dart';
import 'package:provider/provider.dart';

class SummeryScreen extends StatelessWidget {
  const SummeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ProductProvider productProvider, child) {
      return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Summery",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'TiltNeon',
              fontSize: 25,
            ),
          ),
          _addressWidget(productProvider),
          const BillingSummeryWidget()
        ]),
      );
    });
  }
}

Widget _addressWidget(ProductProvider productProvider) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Delivery Address",
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
          children: [
            const Text(
              "Country",
              style: TextStyle(
                  fontFamily: 'TiltNeon',
                  fontSize: 14,
                  color: Colors.grey
              ),
            ),
            Text(
              productProvider.address!.country,
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
          children: [
            const Text(
              "City",
              style: TextStyle(
                  fontFamily: 'TiltNeon',
                  fontSize: 14,
                  color: Colors.grey
              ),
            ),
            Text(
              productProvider.address!.city,
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
          children: [
            const Text(
              "Area",
              style: TextStyle(
                  fontFamily: 'TiltNeon',
                  fontSize: 14,
                  color: Colors.grey
              ),
            ),
            Text(
              productProvider.address!.area,
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
          children: [
            const Text(
              "Street",
              style: TextStyle(
                  fontFamily: 'TiltNeon',
                  fontSize: 14,
                  color: Colors.grey
              ),
            ),
            Text(
              productProvider.address!.street,
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
          children: [
            const Text(
              "Building No.",
              style: TextStyle(
                  fontFamily: 'TiltNeon',
                  fontSize: 14,
                  color: Colors.grey
              ),
            ),
            Text(
              productProvider.address!.buildingNo,
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
}