import 'package:flutter/material.dart';
import 'package:helal/views/login_otp_screen/password_updated_screen.dart';
import 'package:helal/views/main_screen/home_screen.dart';

class OTP3Screen extends StatefulWidget {
  const OTP3Screen({Key? key}) : super(key: key);

  @override
  State<OTP3Screen> createState() => _OTP3ScreenState();
}

class _OTP3ScreenState extends State<OTP3Screen> {

  bool _isInvisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("OTP Step Three",style: TextStyle(fontFamily: 'TiltNeon',)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Column(
                  children: const [
                    Text("New",
                        style: TextStyle(
                            fontFamily: 'OoohBaby',
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0C1A30))),
                    Text("Credentials ",
                        style: TextStyle(
                            fontFamily: 'OoohBaby',
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0C1A30))),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: const [
                    Text("Your identity has been verified!",
                        style: TextStyle(
                            fontFamily: 'TiltNeon',
                            color: Color(0xFF838589),
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    Text("Set your new password",
                        style: TextStyle(
                            fontFamily: 'TiltNeon',
                            color: Color(0xFF838589),
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "    New Password",
                    style: TextStyle(
                        fontFamily: 'TiltNeon',
                        fontSize: 14,
                        color: Color(0xFF838589),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 5),
                Material(
                  elevation: 9.5,
                  shadowColor: Colors.purple,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _isInvisible,
                    decoration: InputDecoration(
                        hintText: 'New Password',
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "    Confirm Password",
                    style: TextStyle(
                        fontFamily: 'TiltNeon',
                        fontSize: 14,
                        color: Color(0xFF838589),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 5),
                Material(
                  elevation: 9.5,
                  shadowColor: Colors.purple,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _isInvisible,
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
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
                const SizedBox(height: 50),
                SizedBox(
                  width: (double.infinity) - 10,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PasswordUpdatedScreen(),));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text(
                      "Rest",
                      style: TextStyle(
                          fontFamily: 'TiltNeon',
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
