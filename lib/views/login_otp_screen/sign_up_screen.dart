import 'package:flutter/material.dart';
import 'package:helal/controller/user_controller.dart';
import 'package:helal/model/user_model.dart';
import 'package:helal/views/main_screen/home_screen.dart';
import 'package:helal/views/login_otp_screen/login_screen.dart';
// ignore: implementation_imports
import 'package:dropdown_button2/src/dropdown_button2.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final UserController _usersController = UserController();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        '  Welcome in ',
                        style: TextStyle(
                          fontFamily: 'OoohBaby',
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'HelaL ',
                        style: TextStyle(
                          fontFamily: 'OoohBaby',
                          fontSize: 30,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'market',
                        style: TextStyle(
                          fontFamily: 'OoohBaby',
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Sign Up",
                    style: TextStyle(
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
                          hintText: 'Full Name',
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
                          hintText: 'Phone Number',
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
                      controller: _addressController,
                      decoration: InputDecoration(
                          hintText: 'Address',
                          prefixIcon: const Icon(
                            Icons.location_pin,
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
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.purple,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        border: OutlineInputBorder(
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
                          hintText: 'Password',
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
                          await _usersController.createUser(user);
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('User created successfully'),
                            ),
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
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
                      const Text('have an account ?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
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
