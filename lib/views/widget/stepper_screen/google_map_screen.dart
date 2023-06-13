import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:helal/model/address.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class GoogleMapStep extends StatefulWidget {
  Position location;

  GoogleMapStep({required this.location, Key? key}) : super(key: key);

  @override
  State<GoogleMapStep> createState() => _GoogleMapStepState();
}

class _GoogleMapStepState extends State<GoogleMapStep> {

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  late CameraPosition _initialPosition;
  late LatLng _requiredLocation;

  @override
  void initState() {
    super.initState();
    _initialPosition = CameraPosition(
        target: LatLng(widget.location.latitude, widget.location.longitude),
        zoom: 19,
    );
  }

  @override
  Widget build(BuildContext context) {
    return mapWidget();
  }

  Widget mapWidget() {
    double mapWidth = MediaQuery.of(context).size.width;
    double mapHeight = MediaQuery.of(context).size.height - 215;
    return Stack(alignment: const Alignment(0.0, 0.0), children: <Widget>[
      SizedBox(
          width: mapWidth,
          height: mapHeight,
          child: GoogleMap(
            mapType: MapType.hybrid,
            mapToolbarEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: _initialPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onCameraMove: (CameraPosition position) {
              _requiredLocation =position.target;
              _getAddressFromLatLng();
            },
            onCameraIdle: () {
              _getAddressFromLatLng();
            },
          )),
      Positioned(
        top: (mapHeight - 50) / 2,
        right: (mapWidth - 50) / 2,
        child: const Icon(
          Icons.location_on,
          size: 50,
          color: Colors.red,
        ),
      ),
    ]);
  }

  Future<void> _getAddressFromLatLng() async {

    List<Placemark> placemarks = await placemarkFromCoordinates(_requiredLocation.latitude, _requiredLocation.longitude);
    Placemark first = placemarks.first;
    Address address = Address(
      latitude: _requiredLocation.latitude,
      longitude: _requiredLocation.longitude,
      country: first.country!,
      city: first.locality!,
      area: first.subLocality!,
      street: first.street!,
    );

    // ignore: use_build_context_synchronously
    var productProvider = Provider.of<ProductProvider>(context,listen: false);
    productProvider.updateAddress(address);
  }
}
