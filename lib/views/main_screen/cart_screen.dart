import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:helal/controller/location_controller.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:helal/model/product_model.dart';
import 'package:helal/views/main_screen/order_checkout_screen.dart';
import 'package:helal/views/widget/empty_cart_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer(
          builder: (context, ProductProvider productProvider, child) {
            if(productProvider.selectedProduct.isEmpty){
              return const EmptyCart();
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        childAspectRatio: 2 / 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 0,
                      ),
                      itemCount: productProvider.selectedProduct.length,
                      itemBuilder: (context, index) {
                        Product product =
                            productProvider.selectedProduct[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
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
                                    flex: 4,
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: DecorationImage(
                                              image:
                                                  NetworkImage(product.image),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                AppLocalizations.of(
                                                    context)!
                                                    .language ==
                                                    "English"
                                                    ? product.name
                                                    : product.nameAr,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "TiltNeon",
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                  "\$${product.price.toStringAsFixed(2)}",
                                                  style: const TextStyle(
                                                      fontFamily: "TiltNeon",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.purple)),
                                            ],
                                          ),
                                          Center(
                                            child: Text(
                                              "${AppLocalizations.of(context)!.quantity} ${product.selectedQty}",
                                              style: const TextStyle(
                                                  fontFamily: "TiltNeon",
                                                  fontSize: 14),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    productProvider.updateQty(product, product.selectedQty +1);
                                                  },
                                                  icon: const Icon(Icons.add,size: 20,)),
                                              Text(
                                                "${product.selectedQty}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green,
                                                    fontSize: 15),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    if(product.selectedQty ==1){
                                                      productProvider.removeProduct(index);
                                                      return;
                                                    }
                                                    productProvider.updateQty(product, product.selectedQty -1);
                                                  },
                                                  icon: product.selectedQty==1
                                                      ?const Icon(Icons.delete,size: 20)
                                                      :const Icon(Icons.remove,size: 20)
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                               Text(
                                                AppLocalizations.of(context)!.total,
                                                style: const TextStyle(
                                                    fontFamily: "TiltNeon",
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                "\$${(product.total).toStringAsFixed(2)}",
                                                style: const TextStyle(
                                                    fontFamily: "TiltNeon",
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "JOD  ${productProvider.total.toStringAsFixed(2)} ",
                            style: const TextStyle(
                                fontFamily: "TiltNeon",
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(AppLocalizations.of(context)!.totalInclVAT,
                            style: const TextStyle(
                                fontFamily: "TiltNeon",
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _handelGoToOrderCheckout(context);                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 40),
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          )
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.checkout,
                          style: const TextStyle(
                              fontFamily: 'TiltNeon',
                              fontSize: 17,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5)
              ],
            );
          },
        ),
      ),
    );
  }
  _handelGoToOrderCheckout(BuildContext context)async{
   try{
     EasyLoading.show(status: AppLocalizations.of(context)!.fetchingLocation);
     Position location =await LocationController().determinePosition();
     EasyLoading.dismiss();
     // ignore: use_build_context_synchronously
     Navigator.push(context, MaterialPageRoute(builder: (context) =>  OrderCheckoutScreen(location)));
   }catch(ex){
     EasyLoading.dismiss();
     EasyLoading.showError(ex.toString());
   }
  }
}
