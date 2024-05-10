import 'package:pmob_petakgov/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmob_petakgov/pages/navpages/home_page.dart';
import 'package:pmob_petakgov/pages/navpages/navbar_page.dart';
import 'package:pmob_petakgov/widgets/custom_button.dart';

class SuccessLoginScreen extends StatefulWidget {
  const SuccessLoginScreen({Key? key}) : super(key: key);

  @override
  State<SuccessLoginScreen> createState() => _SuccessLoginScreenState();
}

class _SuccessLoginScreenState extends State<SuccessLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              "img/animations/verified.json",
              height: 200,
              width: 200,
              repeat: false,
            ),
            const SizedBox(height: 10),
            const Text(
              "Login Successed!",
              style: TextStyle(
                fontSize: kbigFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              color: AppColors.mainColor,
              textColor: Colors.white,
              text: "Go to Home Page",
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
