import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:helal/controller/user_controller.dart';
import 'package:helal/views/main_screen/bottom_navigation_bar.dart';
import 'package:helal/views/login_otp_screen/otp1_screen.dart';
import 'package:helal/views/login_otp_screen/sign_up_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isInvisible = true;
  final _formKey = GlobalKey<FormState>();

  _handleSignInAction(BuildContext context) {
    const storage =  FlutterSecureStorage();
    EasyLoading.show(status: AppLocalizations.of(context)!.loading);
    UserController()
        .login(_emailController.text, _passwordController.text)
        .then((value) async {
      EasyLoading.dismiss();
      await const FlutterSecureStorage()
          .write(key: "token", value: "${value.type} ${value.token}");

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const BottomNavigation()));
    }).catchError((ex) {
      EasyLoading.dismiss();
      EasyLoading.showError(ex.toString());
    });
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.helloIn,
                      style: const TextStyle(
                        fontFamily: 'OoohBaby',
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 100),
                     Text(
                      AppLocalizations.of(context)!.login,
                      style: const TextStyle(
                          fontFamily: 'OoohBaby',
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 50),
                    Material(
                      elevation: 9.5,
                      shadowColor: Colors.deepPurple,
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration:  InputDecoration(
                          hintText: AppLocalizations.of(context)!.email,
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.deepPurple,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                        validator: (value){
                          if(value!.length <= 6  || value.isEmpty){
                            return 'The data entered is not an email type';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Material(
                      elevation: 9.5,
                      shadowColor: Colors.deepPurple,
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        obscureText: _isInvisible,
                        decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.password,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.deepPurple,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _isInvisible = !_isInvisible;
                                setState(() {});
                              },
                              icon: _isInvisible
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50),
                            )),
                        validator: (value){
                          if(value!.length < 6  || value.isEmpty){
                            return 'Password must be more than 6 characters long';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => const OTP1Screen()));
                        },
                        child:  Text(
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
                    const SizedBox(height: 20),
                    SizedBox(
                      width: (double.infinity) - 10,
                      child: ElevatedButton(
                        onPressed: () {
                          _handleSignInAction(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                        ),
                        child:  Text(
                          AppLocalizations.of(context)!.login,
                          style: const TextStyle(
                              fontFamily: 'TiltNeon',
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(AppLocalizations.of(context)!.doNot),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ));
                          },
                          child:  Text(
                            AppLocalizations.of(context)!.create,
                            style: const TextStyle(
                              fontFamily: 'TiltNeon',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
