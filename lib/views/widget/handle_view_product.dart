import 'package:flutter/material.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:helal/model/product_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

handleViewProduct(BuildContext context,Product product) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SizedBox(
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Material(
                    elevation: 9.5,
                    shadowColor: Colors.deepPurple,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: Container(
                      width: (MediaQuery.of(context).size.width) * .5,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage(product.image),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context)!.language == "English"
                        ? product.name
                        : product.nameAr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'TiltNeon'),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${AppLocalizations.of(context)!.pricePerPiece} ${product.price.toStringAsFixed(2)} JD ",
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontFamily: 'TiltNeon'),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              product.selectedQty++;
                            });
                          },
                          icon: const Icon(Icons.add)),
                      const SizedBox(width: 30),
                      Text(
                        "${product.selectedQty}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 18),
                      ),
                      const SizedBox(width: 30),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (product.selectedQty > 0) {
                                product.selectedQty--;
                              }
                            });
                          },
                          icon: const Icon(Icons.remove)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.total,
                          style: const TextStyle(
                              fontFamily: 'TiltNeon', fontSize: 17)),
                      Text("\$${(product.total).toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontFamily: 'TiltNeon',
                              color: Colors.green,
                              fontSize: 17)),
                      const Text(" JD",
                          style:
                              TextStyle(fontFamily: 'TiltNeon', fontSize: 17)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width) * .5,
                    child: ElevatedButton(
                      onPressed: () {
                        if (product.selectedQty > 0) {
                          var productProvider = Provider.of<ProductProvider>(
                              context,
                              listen: false);
                          productProvider.addToCart(product);
                          Navigator.pop(context);
                        }else{
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.addToCart,
                        style: const TextStyle(
                            fontFamily: 'TiltNeon',
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
