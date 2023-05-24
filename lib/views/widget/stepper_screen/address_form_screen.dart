import 'package:flutter/material.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:provider/provider.dart';

class AddressFormScreen extends StatelessWidget {
  AddressFormScreen({super.key});

  final _controllerCountry = TextEditingController();
  final _controllerCity = TextEditingController();
  final _controllerArea = TextEditingController();
  final _controllerStreet = TextEditingController();
  final _controllerBuilding = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ProductProvider productProvider, child) {
      return formWidget(productProvider);
    });
  }

  Widget formWidget(ProductProvider productProvider) {
    _controllerCountry.text = productProvider.address?.country ?? '';
    _controllerCity.text = productProvider.address?.city ?? '';
    _controllerArea.text = productProvider.address?.area ?? '';
    _controllerStreet.text = productProvider.address?.street ?? '';
    _controllerBuilding.text = productProvider.address?.buildingNo ?? '';

    return Form(
        key: productProvider.keyForm,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Country",
                        style: TextStyle(fontFamily: "TiltNeon", fontSize: 17)),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        enabled: false,
                        controller: _controllerCountry,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "Country",
                            suffixIcon: const Icon(Icons.lock_sharp)),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("City",
                        style: TextStyle(fontFamily: "TiltNeon", fontSize: 17)),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        enabled: false,
                        controller: _controllerCity,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "City",
                            suffixIcon: const Icon(Icons.lock_sharp)),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Area",
                        style: TextStyle(fontFamily: "TiltNeon", fontSize: 17)),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        enabled: false,
                        controller: _controllerArea,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "Area",
                            suffixIcon: const Icon(Icons.lock_sharp)),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Street",
                        style: TextStyle(fontFamily: "TiltNeon", fontSize: 17)),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: _controllerStreet,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12)),
                            hintText: "Street"),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Building No.",
                        style: TextStyle(fontFamily: "TiltNeon", fontSize: 17)),
                    TextFormField(
                      controller: _controllerBuilding,
                      onChanged: (value) {
                        productProvider.address!.buildingNo = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12)),
                          hintText: "Please Enter Your Building No. ",errorStyle: const TextStyle(height: 0)),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
