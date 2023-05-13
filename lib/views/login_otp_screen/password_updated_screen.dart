import 'package:flutter/material.dart';
import 'package:helal/views/main_screen/bottom_navigation_bar.dart';

class PasswordUpdatedScreen extends StatelessWidget {
  const PasswordUpdatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Text("Password",
                    style: TextStyle(
                        fontFamily: 'OoohBaby',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0C1A30))),
                const Text("Updated ",
                    style: TextStyle(
                        fontFamily: 'OoohBaby',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0C1A30))),
                const SizedBox(height: 10),
                const Icon(Icons.check_circle_sharp,size: 100,color: Colors.purple,),
                const SizedBox(height: 50),
                const Text('your password has been updated!',style: TextStyle(color: Color(0xFF838589),fontFamily: 'TiltNeon',fontSize: 14),),
                const SizedBox(height: 20),
                SizedBox(
                  width: (MediaQuery.of(context).size.width)*.7,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavigation(),));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}
