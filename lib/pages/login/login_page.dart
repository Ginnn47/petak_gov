import 'package:flutter/widgets.dart';
import 'package:pmob_petakgov/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:pmob_petakgov/pages/login/login_screen.dart';
import 'package:pmob_petakgov/pages/login/signup_screen.dart';
import 'package:pmob_petakgov/widgets/custom_button.dart';

class WelcomeLogin extends StatefulWidget {
  const WelcomeLogin({Key? key}) : super(key: key);

  @override
  State<WelcomeLogin> createState() => _WelcomeLoginState();
}

class _WelcomeLoginState extends State<WelcomeLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "img/motto.png",
            height: 150,
          ),
          const SizedBox(height: 20),
          const Text(
            "Welcome!",
            style: TextStyle(
              fontSize: kbigFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Please login or signup",
            style: TextStyle(fontSize: kmediumFontSize),
          ),
          const SizedBox(height: 20),
          CustomButton(
            color: AppColors.mainColor,
            textColor: Colors.white,
            text: "Login",
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            color: AppColors.starColor,
            textColor: Colors.black,
            text: "Sign Up",
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignupScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
