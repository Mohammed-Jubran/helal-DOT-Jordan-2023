import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {

  _launchCaller() async {
    const url = "tel:0795746832";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        title: const Text("Call us",style: TextStyle(fontFamily: 'TiltNeon')),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              InkWell(
                onTap: (){
                  _launchCaller();
                },
                child: const Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.phone_android_outlined,
                      color: Colors.purple,
                      size: 35,
                    ),
                    title: Text(
                      "Call the customer service center",
                      style: TextStyle(fontFamily: 'TiltNeon'),
                    ),
                    subtitle: Text(
                      "0795746832",
                      style: TextStyle(
                          fontFamily: 'TiltNeon', fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      const Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.email_outlined,
                            color: Colors.purple,
                            size: 35,
                          ),
                          title: Text(
                            "Send us a message",
                            style: TextStyle(fontFamily: 'TiltNeon'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  hintText: "Full Name"
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    hintText: "Phone number"
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    hintText: "Email address"
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    hintText: "Subject"
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              maxLines: 2,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  hintText: "Please explain your problem in detail and our team will contact you as soon as possible"
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: (){
                                  EasyLoading.showSuccess('Message has been sent');
                                  Future.delayed(const Duration(milliseconds: 1000), () async {
                                     EasyLoading.dismiss();
                                     Navigator.pop(context);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purpleAccent,
                                ),
                                child: const Text("Send",style: TextStyle(color: Colors.white,fontFamily: 'TiltNeon',fontSize: 20),),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
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
