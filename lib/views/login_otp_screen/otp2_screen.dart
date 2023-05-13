import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:helal/views/login_otp_screen/otp3_screen.dart';

class OTP2Screen extends StatefulWidget {
  const OTP2Screen({Key? key}) : super(key: key);

  @override
  State<OTP2Screen> createState() => _OTP2ScreenState();
}

class _OTP2ScreenState extends State<OTP2Screen> {

  String? _code;
  bool _onEditing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Step Two",style: TextStyle(fontFamily: 'TiltNeon',)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text("OTP Verification",
                  style: TextStyle(
                      fontFamily: 'OoohBaby',
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0C1A30))),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  const Text(
                    "Enter the code from the sms we sent",
                    style: TextStyle(
                        fontFamily: 'TiltNeon',
                        color: Color(0xFF838589),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "to ",
                        style: TextStyle(
                            fontFamily: 'TiltNeon',
                            color: Color(0xFF838589),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "+962******832 ",
                        style: TextStyle(
                            fontFamily: 'TiltNeon',
                            color: Color(0xFF0C1A30),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                "02:32",
                style: TextStyle(
                    fontFamily: 'TiltNeon',
                    color: Colors.purple,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5),
              VerificationCode(
                textStyle: const TextStyle(color: Color(0xFF0C1A30)),
                keyboardType: TextInputType.number,
                underlineWidth: 1,
                underlineUnfocusedColor: Colors.purple,
                length: 4,
                cursorColor: Colors.black,
                margin: const EdgeInsets.all(12),
                onCompleted: (String value) {
                  setState(() {
                    _code = value;
                  });
                },
                onEditing: (bool value) {
                  setState(() {
                    _onEditing = value;
                  });
                  if (!_onEditing) FocusScope.of(context).unfocus();
                },
                fullBorder: true,
                fillColor: const Color(0xFFFAFAFA),
                itemSize: 50,
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t receive the OTP?',style: TextStyle(color: Color(0xFF838589),fontFamily: 'TiltNeon',fontSize: 14),),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'RESEND',
                      style: TextStyle(
                        color: Colors.purple,
                        fontFamily: 'TiltNeon',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: (double.infinity) - 10,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OTP3Screen(),));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  child: const Text(
                    "Submit",
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
    );
  }
}
