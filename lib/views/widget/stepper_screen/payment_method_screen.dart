import 'package:flutter/material.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
                title: Text(
                  AppLocalizations.of(context)!.cashOnDelivery,
                  style: const TextStyle(
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
                title: Text(
                  AppLocalizations.of(context)!.debitCard,
                  style: const TextStyle(
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
                    decoration:  InputDecoration(
                      hintText: AppLocalizations.of(context)!.cardNumber,
                      prefixIcon: const Icon(Icons.payment),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    enabled: isDebitCardSelected,
                    decoration:  InputDecoration(
                      hintText: AppLocalizations.of(context)!.holderName,
                      prefixIcon: const Icon(Icons.person_2_outlined),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: TextField(
                          enabled: isDebitCardSelected,
                          decoration:  InputDecoration(
                            hintText: AppLocalizations.of(context)!.exp,
                            prefixIcon: const Icon(Icons.calendar_month),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        child: TextField(
                          enabled: isDebitCardSelected,
                          decoration:  InputDecoration(
                            hintText: AppLocalizations.of(context)!.cVV,
                            prefixIcon: const Icon(Icons.lock_outline),
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
