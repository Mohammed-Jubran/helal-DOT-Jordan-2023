import 'package:flutter/material.dart';
import 'package:helal/controller/user_controller.dart';
import 'package:helal/model/user_model.dart';
import 'package:helal/views/login_otp_screen/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                  const SizedBox(height: 30),
                   Text(
                    AppLocalizations.of(context)!.signUp,
                    style: const TextStyle(
                        fontFamily: 'OoohBaby',
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  Material(
                    elevation: 9.5,
                    shadowColor: Colors.purple,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: TextFormField(
                      controller: _fullNameController,
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.userName,
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.purple,
                          ),
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'this filed is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Material(
                    elevation: 9.5,
                    shadowColor: Colors.purple,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.phoneNumber,
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.purple,
                          ),
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'this filed is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Material(
                    elevation: 9.5,
                    shadowColor: Colors.purple,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: TextFormField(
                      controller: _emailController,
                      decoration:  InputDecoration(
                        hintText: AppLocalizations.of(context)!.email,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.purple,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'this filed is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Material(
                    elevation: 9.5,
                    shadowColor: Colors.purple,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.password,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.purple,
                          ),
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'this filed is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: (double.infinity) - 10,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          User user = User(
                            fullName: _fullNameController.text,
                            phone: _phoneController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          await UserController().createUser(user);
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                              content: Text(AppLocalizations.of(context)!.userCreatedSuccessfully),
                            ),
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                      ),
                      child:  Text(
                        AppLocalizations.of(context)!.signUp,
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
                      Text(AppLocalizations.of(context)!.haveAnAccount),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                        },
                        child:  Text(
                          AppLocalizations.of(context)!.login,
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
