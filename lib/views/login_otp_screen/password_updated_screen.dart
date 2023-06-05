import 'package:flutter/material.dart';
import 'package:helal/views/main_screen/bottom_navigation_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
                 Text(AppLocalizations.of(context)!.password,
                    style: const TextStyle(
                        fontFamily: 'OoohBaby',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        )),
                Text(AppLocalizations.of(context)!.updated,
                    style: const TextStyle(
                        fontFamily: 'OoohBaby',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                       )),
                const SizedBox(height: 10),
                const Icon(Icons.check_circle_sharp,size: 100,color: Colors.deepPurple,),
                const SizedBox(height: 50),
                Text(AppLocalizations.of(context)!.yourPasswordHasBeenUpdated,style: const TextStyle(color: Color(0xFF838589),fontFamily: 'TiltNeon',fontSize: 14),),
                const SizedBox(height: 20),
                SizedBox(
                  width: (MediaQuery.of(context).size.width)*.7,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavigation(),));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: const TextStyle(
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
