import 'package:flutter/material.dart';
import 'package:banner_image/banner_image.dart';
import 'package:helal/controller/category_controller.dart';
import 'package:helal/controller/product_controller.dart';
import 'package:helal/model/category_model.dart';
import 'package:helal/model/product_model.dart';
import 'package:helal/views/main_screen/products_screen.dart';
import 'package:helal/views/widget/handle_view_product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helal/views/widget/one_product_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final list = [
    'assets/images/hyper.jpeg',
    'assets/images/hypermarket-2.jpeg',
    'assets/images/hypermarket-3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: FutureBuilder(
              future: CategoryController().getAll(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BannerImage(
                        aspectRatio: 2.7,
                        itemLength: list.length,
                        withOutIndicator: false,
                        selectedIndicatorColor: Colors.deepPurple,
                        autoPlay: true,
                        borderRadius: BorderRadius.circular(8),
                        children: List.generate(
                          list.length,
                          (index) => Image.asset(
                            list[index],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child:
                            Text(AppLocalizations.of(context)!.categoriesUpper,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'TiltNeon',
                                )),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 110,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemBuilder: (context, index) {
                            Category category = snapshot.data![index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductsScreen(
                                          categoryId: category.id,
                                          categoryName: AppLocalizations.of(context)!.language == "English" ?
                                          category.name
                                              : category.nameAr ),
                                    ));
                              },
                              child: Column(
                                children: [
                                  Material(
                                    shape: const CircleBorder(),
                                    elevation: 10,
                                    color: Colors.deepPurple,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 35,
                                      backgroundImage:
                                          NetworkImage(category.image),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                      AppLocalizations.of(context)!.language ==
                                              "English"
                                          ? category.name
                                          : category.nameAr,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'TiltNeon',
                                         )),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 15),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(AppLocalizations.of(context)!.specialOffers,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'TiltNeon',
                            )),
                      ),
                      FutureBuilder(
                          future: ProductController().getFeaturedProducts(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Container(
                                height: ((MediaQuery.of(context).size.height) *
                                        .35) -
                                    10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: double.infinity,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.length,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  itemBuilder: (context, index) {
                                    Product product = snapshot.data![index];
                                    return InkWell(
                                      onTap: () {
                                        handleViewProduct(context,product);
                                      },
                                      child:OneProductHome(product: product),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 15),
                                ),
                              );
                            }
                            return Container();
                          }),
                    ],
                  );
                }
                return Container(
                  color: Colors.red,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
