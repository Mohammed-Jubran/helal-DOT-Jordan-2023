import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.aboutAs,style: const TextStyle(fontFamily: 'TiltNeon')),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: SingleChildScrollView(
            child: Column(
              children:  [
                Text(
                  AppLocalizations.of(context)!.pOne,
                  style: const TextStyle(
                      fontFamily: 'TiltNeon',
                      color: Colors.black,
                      fontSize: 17),
                ),
                const SizedBox(height: 10),
                 Text(
                    AppLocalizations.of(context)!.pTwo,
                    style: const TextStyle(
                        fontFamily: 'TiltNeon',
                        color: Colors.black,
                        fontSize: 17)),
                const SizedBox(height: 10),
                Text(
                    AppLocalizations.of(context)!.pThree,
                    style: const TextStyle(
                        fontFamily: 'TiltNeon',
                        color: Colors.black,
                        fontSize: 17)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
