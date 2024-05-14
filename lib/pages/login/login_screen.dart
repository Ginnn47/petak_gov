import 'package:firebase_auth/firebase_auth.dart';
import 'package:pmob_petakgov/firebase_auth_implementation/firebase_auth_service.dart';
import 'package:pmob_petakgov/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:pmob_petakgov/pages/login/signup_screen.dart';
import 'package:pmob_petakgov/pages/login/succes_login_screen.dart';
import 'package:pmob_petakgov/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FireBaseAuthService _auth = FireBaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isRememberMe = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  FireBaseAuthService auth = FireBaseAuthService();

  void _signin(String email, password) {
    auth.signInWithEmailAndPassword(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("img/robot.png", height: 200),
                  const SizedBox(height: 20),
                  const Text(
                    "Login To Account",
                    style: TextStyle(
                      fontSize: kbigFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: _isRememberMe,
                        onChanged: (value) {
                          setState(() {
                            _isRememberMe = value!;
                          });
                        },
                        activeColor: AppColors.mainColor,
                      ),
                      const SizedBox(width: 5),
                      const Text("Remember Me"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    color: AppColors.mainColor,
                    textColor: Colors.white,
                    text: "Login",
                    onPress: () async {
                      _signin(_emailController.text, _passwordController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuccessLoginScreen(),
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
            ),
          ),
        ),
      ),
    );
  }
}
