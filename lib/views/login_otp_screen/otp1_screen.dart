import 'package:flutter/material.dart';

class OTP1Screen extends StatefulWidget {
  const OTP1Screen({Key? key}) : super(key: key);

  @override
  State<OTP1Screen> createState() => _OTP1ScreenState();
}

class _OTP1ScreenState extends State<OTP1Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios_new_outlined,size: 20,),
          title: const Text("Forget password"),
          centerTitle: true,
        ),
        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: (MediaQuery.of(context).size.height)*.4,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Enter OTP-amico.png")
                    )
                  ),
                ),
                const SizedBox(height: 40),
                const Text("Reset Password",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0C1A30))),
                const SizedBox(height: 20),
                const Text(
                    "Enter your phone number you used",
                    style: TextStyle(
                        color: Color(0xFF838589),
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                const SizedBox(height: 75),
                const Text(
                  "Email/ Phone",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0C1A30),
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFfafbfb),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    enabled: true,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: ' Masukan Alamat Email/ No Telepon Anda',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFC4C5C4)),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(height: 76),
                SizedBox(
                  width: (double.infinity) - 10,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Container(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3669C9),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      "Reset",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w500),
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
