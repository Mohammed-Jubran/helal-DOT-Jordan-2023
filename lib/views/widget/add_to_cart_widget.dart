import 'package:flutter/material.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:helal/views/main_screen/cart_screen.dart';
import 'package:helal/views/widget/with_notification_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context,ProductProvider productProvider , child) => Material(
      elevation: 10,
      shadowColor: Colors.purple,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen(),));

        },
        child: SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const WithNotification(),
                Text(AppLocalizations.of(context)!.viewCart,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "TiltNeon",
                    )),
                Text(productProvider.total.toStringAsFixed(2),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "TiltNeon",
                    )),
              ],
            ),
          ),
        ),
      ),
    ),);
  }
}
