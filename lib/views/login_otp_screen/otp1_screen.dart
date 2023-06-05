import 'package:flutter/material.dart';
import 'package:helal/views/login_otp_screen/login_screen.dart';
import 'package:helal/views/login_otp_screen/otp2_screen.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OTP1Screen extends StatefulWidget {
  const OTP1Screen({Key? key}) : super(key: key);

  @override
  State<OTP1Screen> createState() => _OTP1ScreenState();
}

class _OTP1ScreenState extends State<OTP1Screen> {

  String initialCountry = 'JO';
  PhoneNumber number = PhoneNumber(isoCode: 'JO');
  String _phone = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  Text(AppLocalizations.of(context)!.oTPStepOne,style: const TextStyle(fontFamily: 'TiltNeon',)),
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
                      image: AssetImage("assets/images/Enter OTP-amico.png"),
                      fit: BoxFit.fill
                    )
                  ),
                ),
                Text(AppLocalizations.of(context)!.verifyYourPhoneNumber,
                    style: const TextStyle(
                        fontFamily: 'OoohBaby',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        )),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                        AppLocalizations.of(context)!.weHaveSendYouAn,
                        style: const TextStyle(
                            color: Color(0xFF838589),
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    Text(
                        AppLocalizations.of(context)!.oneTimePassword,
                        style: const TextStyle(
                            fontFamily: 'TiltNeon',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                const SizedBox(height: 10),
                 Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.enterMobileNo,
                    style: const TextStyle(
                        fontFamily: 'TiltNeon',
                        fontSize: 14,
                        color: Color(0xFF838589),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 5),
                Material(
                  elevation: 9.5,
                  shadowColor: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(50),
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      _phone = number.phoneNumber!;
                    },
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.DROPDOWN,
                    ),
                    hintText: AppLocalizations.of(context)!.phoneNumber,
                    ignoreBlank: false,
                    initialValue: number,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: const TextStyle(color: Colors.black),
                    formatInput: false,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(AppLocalizations.of(context)!.haveAnAccount,style: const TextStyle(color: Color(0xFF838589),fontFamily: 'TiltNeon',fontSize: 14),),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                      },
                      child:  Text(
                        AppLocalizations.of(context)!.login,
                        style: const TextStyle(
                          fontFamily: 'TiltNeon',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: (double.infinity) - 10,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const OTP2Screen(),));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.getOTP,
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
