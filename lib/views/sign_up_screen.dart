import 'package:flutter/material.dart';
import 'package:helal/views/home_screen.dart';
import 'package:helal/views/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
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
                const SizedBox(height: 50),
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
                  child: TextField(
                    controller: _fullNameController,
                    decoration: InputDecoration(
                        hintText: 'Full Name',
                        prefixIcon: const Icon(
                          Icons.drive_file_rename_outline,
                          color: Colors.purple,
                        ),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        )),
                  ),
                ),
                const SizedBox(height: 15),
                Material(
                  elevation: 9.5,
                  shadowColor: Colors.purple,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: TextField(
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
                  ),
                ),
                const SizedBox(height: 15),
                Material(
                  elevation: 9.5,
                  shadowColor: Colors.purple,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: TextField(
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
                  ),
                ),
                const SizedBox(height: 15),
                Material(
                  elevation: 9.5,
                  shadowColor: Colors.purple,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: TextField(
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
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: (double.infinity) - 10,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
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
    );
  }
}
