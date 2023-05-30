import 'package:flutter/material.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      return formWidget(context,productProvider);
    });
  }

  Widget formWidget(BuildContext context,ProductProvider productProvider) {
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
                    Text(AppLocalizations.of(context)!.country,
                        style: const TextStyle(fontFamily: "TiltNeon", fontSize: 17)),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        enabled: false,
                        controller: _controllerCountry,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: AppLocalizations.of(context)!.country,
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
                    Text(AppLocalizations.of(context)!.city,
                        style: const TextStyle(fontFamily: "TiltNeon", fontSize: 17)),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        enabled: false,
                        controller: _controllerCity,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: AppLocalizations.of(context)!.city,
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
                    Text(AppLocalizations.of(context)!.area,
                        style: const TextStyle(fontFamily: "TiltNeon", fontSize: 17)),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        enabled: false,
                        controller: _controllerArea,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: AppLocalizations.of(context)!.area,
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
                    Text(AppLocalizations.of(context)!.street,
                        style: const TextStyle(fontFamily: "TiltNeon", fontSize: 17)),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: _controllerStreet,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12)),
                            hintText: AppLocalizations.of(context)!.street),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(AppLocalizations.of(context)!.buildingNo,
                        style: const TextStyle(fontFamily: "TiltNeon", fontSize: 17)),
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
                          hintText: AppLocalizations.of(context)!.buildingNoReq,errorStyle: const TextStyle(height: 0)),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.buildingNoReq;
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
