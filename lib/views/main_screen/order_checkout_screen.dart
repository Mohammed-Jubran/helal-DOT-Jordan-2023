import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:helal/controller/product_provider.dart';
import 'package:helal/views/widget/stepper_screen/address_form_screen.dart';
import 'package:helal/views/widget/stepper_screen/google_map_screen.dart';
import 'package:helal/views/widget/stepper_screen/payment_method_screen.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class OrderCheckoutScreen extends StatefulWidget {
  Position location;
   OrderCheckoutScreen( this.location,{super.key});

  @override
  State<OrderCheckoutScreen> createState() => _OrderCheckoutScreenState();
}

class _OrderCheckoutScreenState extends State<OrderCheckoutScreen> {
  int activeStep = 0;
  int upperBound = 4;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              IconStepper(
                icons: const [
                  Icon(Icons.add_location_alt, color: Colors.white),
                  Icon(Icons.location_on_rounded, color: Colors.white),
                  Icon(Icons.payment_rounded, color: Colors.white),
                  Icon(Icons.summarize, color: Colors.white),
                ],
                lineColor: Colors.green,
                stepColor: Colors.indigo,
                activeStepBorderColor: Colors.purple,
                activeStepColor: Colors.deepPurple,
                enableNextPreviousButtons: false,
                lineLength: 25,
                activeStep: activeStep,
                onStepReached: (index) {
                  setState(() {
                    activeStep = index;
                  });
                },
              ),
              Expanded(
                  child: IndexedStack(
                    index: activeStep,
                    children: [
                      GoogleMapStep(location: widget.location,),
                      AddressFormScreen(),
                      const PaymentMethodScreen(),
                      Container(),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  previousButton(),
                  nextButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Returns the next button.
  Widget nextButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(100, 40),
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
          )
      ),
      onPressed: () {
        var productProvider =
        Provider.of<ProductProvider>(context, listen: false);
        switch (activeStep) {
          case 0:
            setState(() {
              activeStep++;
            });
            break;
          case 1:
            if (productProvider.keyForm.currentState!.validate()) {
              setState(() {
                activeStep++;
              });
            }
            break;
          case 2:
            setState(() {
              activeStep++;
            });
            break;
          case 3:
            // OrderController()
            //     .create(Order(
            //     products: productProvider.selectedProducts,
            //     address: productProvider.address!,
            //     paymentMethodId: productProvider.paymentMethod,
            //     total: productProvider.total,
            //     taxAmount: productProvider.taxAmount,
            //     subTotal: productProvider.subTotal))
            //     .then((value) {
            //   EasyLoading.dismiss();
            //   EasyLoading.showSuccess("Done");
            // }).catchError((ex) {
            //   EasyLoading.dismiss();
            //   EasyLoading.showError(ex.toString());
            // });
            break;
        }
      },
      child: const Text('Next',
          style: TextStyle(
              fontFamily: 'TiltNeon',
              fontSize: 17,
              color: Colors.white)),
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(100, 40),
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
          )
      ),
      onPressed: () {
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
        else{
          Navigator.pop(context);
        }
      },
      child: const Text('Previous',
          style: TextStyle(
              fontFamily: 'TiltNeon',
              fontSize: 17,
              color: Colors.white)),
    );
  }

}

