import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:helal/views/more_screen/about_us_screen.dart';
import 'package:helal/views/login_otp_screen/login_screen.dart';
import 'package:helal/views/more_screen/contact_screen.dart';
import 'package:helal/views/more_screen/profile_screen.dart';
import 'package:helal/views/widget/language_picker_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Icon(
                Icons.shopping_cart_outlined,
                size: 150,
                color: Colors.deepPurple,
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProfileScreen(),));
                },
                child:  ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Colors.deepPurple,
                  ),
                  title: Text(AppLocalizations.of(context)!.editProfile,
                      style: const TextStyle(fontFamily: "TiltNeon")),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CallScreen(),));

                },
                child:  ListTile(
                  leading: const Icon(
                    Icons.phone,
                    color: Colors.deepPurple,
                  ),
                  title:
                      Text(AppLocalizations.of(context)!.contactUs, style: const TextStyle(fontFamily: "TiltNeon")),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              const Divider(),
               ListTile(
                leading: const Icon(
                  Icons.translate,
                  color: Colors.deepPurple,
                ),
                title:
                    Text(AppLocalizations.of(context)!.language, style: const TextStyle(fontFamily: "TiltNeon")),
                trailing:const LanguagePickerWidget(),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutUsScreen(),
                      ));
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.info,
                    color: Colors.deepPurple,
                  ),
                  title: Text(AppLocalizations.of(context)!.aboutAs,
                      style: const TextStyle(fontFamily: "TiltNeon")),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () async {
                  await const FlutterSecureStorage().delete(key: "token");
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.deepPurple,
                  ),
                  title:
                      Text(AppLocalizations.of(context)!.logout, style: const TextStyle(fontFamily: "TiltNeon")),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple,
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
