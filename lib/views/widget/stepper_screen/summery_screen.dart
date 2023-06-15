import 'package:flutter/material.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:helal/views/widget/billing_summery_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SummeryScreen extends StatelessWidget {
  const SummeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ProductProvider productProvider, child) {
      return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            AppLocalizations.of(context)!.summary,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'TiltNeon',
              fontSize: 25,
            ),
          ),
          _addressWidget(context,productProvider),
          const BillingSummeryWidget()
        ]),
      );
    });
  }
}

Widget _addressWidget(BuildContext context,ProductProvider productProvider) {
  final address = productProvider.address;
  if (address == null) {
    // Handle the case when the address is null, for example, show a placeholder or an error message.
    return const Text('Address is not available');
  }
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.deliveryAddress,
          style: const TextStyle(
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
             Text(
              AppLocalizations.of(context)!.country,
              style: const TextStyle(
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
            Text(
              AppLocalizations.of(context)!.city,
              style: const TextStyle(
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
            Text(
              AppLocalizations.of(context)!.area,
              style: const TextStyle(
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
            Text(
              AppLocalizations.of(context)!.street,
              style: const TextStyle(
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
            Text(
              AppLocalizations.of(context)!.buildingNo,
              style: const TextStyle(
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