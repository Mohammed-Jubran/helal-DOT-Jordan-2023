import 'package:flutter/material.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:provider/provider.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ProductProvider productProvider, child) {
      bool isDebitCardSelected = productProvider.paymentMethod == 2;
      return SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ListTile(
                onTap: () {
                  productProvider.updatePaymentMethod(1);
                },
                leading: const Icon(
                  Icons.attach_money_outlined,
                  color: Colors.deepPurple,
                ),
                title: const Text(
                  "Cash On Delivery",
                  style: TextStyle(
                    fontFamily: 'TiltNeon',
                    fontSize: 17,
                  ),
                ),
                trailing: Radio<int>(
                  value: 1,
                  groupValue: productProvider.paymentMethod,
                  onChanged: (value) {
                    productProvider.updatePaymentMethod(value!);
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  productProvider.updatePaymentMethod(2);
                },
                leading: const Icon(
                  Icons.payment,
                  color: Colors.deepPurple,
                ),
                title: const Text(
                  "Debit Card",
                  style: TextStyle(
                    fontFamily: 'TiltNeon',
                    fontSize: 17,
                  ),
                ),
                trailing: Radio<int>(
                  value: 2,
                  groupValue: productProvider.paymentMethod,
                  onChanged: (value) {
                    productProvider.updatePaymentMethod(value!);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextField(
                    enabled: isDebitCardSelected,
                    decoration: const InputDecoration(
                      hintText: "Card Number",
                      prefixIcon: Icon(Icons.payment),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    enabled: isDebitCardSelected,
                    decoration: const InputDecoration(
                      hintText: "Holder Name",
                      prefixIcon: Icon(Icons.person_2_outlined),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: TextField(
                          enabled: isDebitCardSelected,
                          decoration: const InputDecoration(
                            hintText: "MM/YY",
                            prefixIcon: Icon(Icons.calendar_month),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        child: TextField(
                          enabled: isDebitCardSelected,
                          decoration: const InputDecoration(
                            hintText: "CVV",
                            prefixIcon: Icon(Icons.lock_outline),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
