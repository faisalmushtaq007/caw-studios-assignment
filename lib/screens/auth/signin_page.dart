import 'dart:developer';

import 'package:caw_studios_assessment/screens/bottom_nav_screen.dart';
import 'package:caw_studios_assessment/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  bool done = false;
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Logo.png',
                    height: 70,
                    width: 70,
                  ),
                  Text(
                    "Welcome to \nHealthNest",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        log(number.phoneNumber!.replaceAll(number.dialCode!, "").toString());
                        if (number.phoneNumber!.isNotEmpty &&
                            number.phoneNumber!.replaceAll(number.dialCode!, "").toString().length == 10) {
                          setState(() {
                            done = true;
                          });
                        } else {
                          setState(() {
                            done = false;
                          });
                        }
                      },
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: false,
                      hintText: "Enter Mobile Number",
                      spaceBetweenSelectorAndTextField: 0,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: controller,
                      formatInput: false,
                      inputDecoration: InputDecoration(
                          suffixIcon: Icon(
                        Icons.phone_outlined,
                        color: Colors.grey.shade400,
                      )),
                      keyboardType: TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      inputBorder: UnderlineInputBorder(),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                  ),
                  Text(
                    "We never compromise on security!\nHelp us create a safe place by providing your mobile number to maintain authenticity.",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.grey.shade400,
                        ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 21, vertical: 15)),
                        backgroundColor: MaterialStateProperty.all(
                            done ? Helper.primary : Colors.grey.shade400),
                      ),
                      onPressed: done ? () {
                        Navigator.push(context, PageTransition(child: BottomNavScreen(), type: PageTransitionType.rightToLeft));
                      } : null,
                      child: Text(
                        'Send OTP',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
