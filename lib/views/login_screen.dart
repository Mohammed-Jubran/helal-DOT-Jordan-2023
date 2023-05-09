import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:helal/controller/user_controller.dart';
import 'package:helal/model/user_model.dart';
import 'package:helal/views/bottom_navigation_bar.dart';
import 'package:helal/views/otp1_screen.dart';
import 'package:helal/views/sign_up_screen.dart';

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

  _login() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      User user = User(email: email, password: password);
      EasyLoading.show(status: "Loading");
      UserController().login(email, password).then((value) {
        EasyLoading.dismiss();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BottomNavigation(),));
      }).catchError((ex) {
        print(ex);
        EasyLoading.dismiss();
        EasyLoading.showError(ex.toString());
      });
    }
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
                    const SizedBox(height: 100),
                    const Text(
                      "Login",
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
                      shadowColor: Colors.purple,
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: _isInvisible,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.purple,
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
                        child: const Text(
                          'Forget Password ?',
                          style: TextStyle(
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
                          _login();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purpleAccent,
                        ),
                        child: const Text(
                          "Login",
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
                        const Text('Don\'t have an account ?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ));
                          },
                          child: const Text(
                            'Create',
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
