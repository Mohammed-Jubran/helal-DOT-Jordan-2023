import 'package:flutter/material.dart';
import 'package:helal/model/product_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OneProductCat extends StatelessWidget {
  const OneProductCat({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 7,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xFFf6f5f4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(5),
                      image: DecorationImage(
                          image: NetworkImage(
                              product.image),
                          fit: BoxFit.cover)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.language == "English" ?
                        product.name
                            : product.nameAr,
                        style: const TextStyle(
                            fontWeight:
                            FontWeight.w600,
                            fontFamily: "TiltNeon",
                            fontSize: 15),
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [
                          Text(
                              "\$${product.price.toStringAsFixed(2)}",
                              style: const TextStyle(
                                  fontFamily:
                                  "TiltNeon",
                                  fontWeight:
                                  FontWeight.bold,
                                  color:
                                  Colors.purple)),
                          Text(
                            product.size,
                            style: const TextStyle(
                                fontSize: 10,
                                fontFamily:
                                "TiltNeon",
                                fontWeight:
                                FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}