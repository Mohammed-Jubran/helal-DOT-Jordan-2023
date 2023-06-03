import 'package:flutter/material.dart';
import 'package:helal/controller/product_controller.dart';
import 'package:helal/model/product_model.dart';
import 'package:helal/views/widget/add_to_cart_widget.dart';
import 'package:helal/views/widget/handle_view_product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductsScreen extends StatefulWidget {
  final int categoryId;
  final String categoryName;

  const ProductsScreen(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late int receivedCategoryId;
  late String receivedCategoryName;

  @override
  void initState() {
    super.initState();
    receivedCategoryId = widget.categoryId;
    receivedCategoryName = widget.categoryName;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ProductController().getByCategoryId(receivedCategoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text(receivedCategoryName,
                      style: const TextStyle(fontFamily: 'TiltNeon')),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 0,
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Product product = snapshot.data![index];
                            return InkWell(
                              onTap: () {
                                handleViewProduct(context,product);
                              },
                              child: Padding(padding: const EdgeInsets.symmetric(vertical: 10),
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
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const AddToCartWidget(),
                  ],
                ),
              ),
            );
          }
          return Container();
        });
  }
}
