import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
        title: Text(AppLocalizations.of(context)!.contactUs,style: const TextStyle(fontFamily: 'TiltNeon')),
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
                child:  Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone_android_outlined,
                      color: Colors.purple,
                      size: 35,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.callTheCustomerServiceCenter,
                      style: const TextStyle(fontFamily: 'TiltNeon'),
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)!.telPhone,
                      style: const TextStyle(
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
                      Card(
                        child: ListTile(
                          leading: const Icon(
                            Icons.email_outlined,
                            color: Colors.purple,
                            size: 35,
                          ),
                          title: Text(
                            AppLocalizations.of(context)!.sendUsAMessage,
                            style: const TextStyle(fontFamily: 'TiltNeon'),
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
                                  hintText: AppLocalizations.of(context)!.userName
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
                                    hintText: AppLocalizations.of(context)!.phoneNumber
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
                                    hintText: AppLocalizations.of(context)!.email
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
                                    hintText: AppLocalizations.of(context)!.subject
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              maxLines: 2,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  hintText: AppLocalizations.of(context)!.pleaseExplainYourProblem
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: (){
                                  EasyLoading.showSuccess(AppLocalizations.of(context)!.messageHasBeenSent);
                                  Future.delayed(const Duration(milliseconds: 1000), () async {
                                     EasyLoading.dismiss();
                                     Navigator.pop(context);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purpleAccent,
                                ),
                                child: Text(AppLocalizations.of(context)!.send,style: const TextStyle(color: Colors.white,fontFamily: 'TiltNeon',fontSize: 20),),
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
