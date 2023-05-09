import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:helal/views/more_screen/about_us_screen.dart';
import 'package:helal/views/login_otp_screen/login_screen.dart';
import 'package:helal/views/more_screen/call_screen.dart';
import 'package:helal/views/more_screen/profile_screen.dart';

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
                color: Colors.purple,
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen(),));
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.purple,
                  ),
                  title: Text("Edit profile",
                      style: TextStyle(fontFamily: "TiltNeon")),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.purple,
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CallScreen(),));

                },
                child: const ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.purple,
                  ),
                  title:
                      Text("Call us", style: TextStyle(fontFamily: "TiltNeon")),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.purple,
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  leading: Icon(
                    Icons.star_rate,
                    color: Colors.purple,
                  ),
                  title:
                      Text("Rate us", style: TextStyle(fontFamily: "TiltNeon")),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.purple,
                  ),
                ),
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
                child: const ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Colors.purple,
                  ),
                  title: Text("About as",
                      style: TextStyle(fontFamily: "TiltNeon")),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.purple,
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
                child: const ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.purple,
                  ),
                  title:
                      Text("Logout", style: TextStyle(fontFamily: "TiltNeon")),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.purple,
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
