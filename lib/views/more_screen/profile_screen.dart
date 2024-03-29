import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:helal/controller/user_controller.dart';
import 'package:helal/views/login_otp_screen/otp1_screen.dart';
import 'package:helal/views/main_screen/bottom_navigation_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});

  final _controllerUsername = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPhone = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.myAccount,style: const TextStyle(fontFamily: 'TiltNeon')),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder(
            future: UserController().getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _controllerUsername.text = snapshot.data!.fullName;
                _controllerEmail.text = snapshot.data!.email;
                _controllerPhone.text = snapshot.data!.phone!;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Card(
                          shadowColor: Colors.deepPurple,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Text(AppLocalizations.of(context)!.userName,
                                    style: const TextStyle(fontFamily: "TiltNeon", fontSize: 17)),
                                const SizedBox(height: 5),
                                TextFormField(
                                  controller: _controllerUsername,
                                  validator: (value) {
                                    if (value == null || value.length < 2) {
                                      return "The username is required";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(Icons.person),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5)),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black12)),
                                      hintText: AppLocalizations.of(context)!.userName,errorStyle: const TextStyle(height: 0)),
                                ),
                                const SizedBox(height: 10),
                                Text(AppLocalizations.of(context)!.email,
                                    style: const TextStyle(fontFamily: "TiltNeon", fontSize: 17)),
                                const SizedBox(height: 5),
                                TextFormField(
                                  controller: _controllerEmail,
                                  validator: (value) {
                                    if (!EmailValidator.validate(value!)) {
                                      return AppLocalizations.of(context)!.email;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      suffixIcon: const Icon(Icons.email_rounded),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5)),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black12)),
                                      hintText: AppLocalizations.of(context)!.email,errorStyle: const TextStyle(height: 0)),
                                ),
                                const SizedBox(height: 10),
                                Text(AppLocalizations.of(context)!.phoneNumber,
                                    style: const TextStyle(fontFamily: "TiltNeon", fontSize: 17)),
                                const SizedBox(height: 5),
                                TextFormField(
                                  controller: _controllerPhone,
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return "This field is required";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      suffixIcon: const Icon(Icons.phone),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5)),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black12)),
                                      hintText: AppLocalizations.of(context)!.phoneNumber,errorStyle: const TextStyle(height: 0)),
                                ),
                                const SizedBox(height: 30),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:Colors.deepPurple,
                                    ),
                                      onPressed: () {
                                     _handleSubmitAction();
                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavigation(),));
                                      },
                                      child: Text(AppLocalizations.of(context)!.submit,
                                        style: const TextStyle(
                                            fontFamily: 'TiltNeon',
                                            fontSize: 17,
                                            color: Colors.white),)),
                                ),
                                const SizedBox(height: 40),
                                Align(
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (context) => const OTP1Screen()));
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.forgetPassword,
                                      style: const TextStyle(
                                        color: Colors.deepPurple,
                                        fontFamily: 'TiltNeon',
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ),
                      )),
                );
              }
              if (snapshot.hasError) {
                return const Center(child: Text("There are some certain of errors"));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

   _handleSubmitAction() {
     if (_formKey.currentState!.validate()) {
       EasyLoading.show(status: "Loading");
       UserController()
           .update(
           email: _controllerEmail.text,
           phone: _controllerPhone.text,
           fullName: _controllerUsername.text,)
           .then((value) {
         EasyLoading.dismiss();
         EasyLoading.showSuccess("Done");
       }).catchError((ex) {
         EasyLoading.dismiss();
         EasyLoading.showError(ex.toString());
       });
     }
   }
}