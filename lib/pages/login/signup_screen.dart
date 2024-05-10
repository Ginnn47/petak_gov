import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:pmob_petakgov/firebase_auth_implementation/firebase_auth_service.dart';
import 'package:pmob_petakgov/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:pmob_petakgov/pages/login/succes_login_screen.dart';
import 'package:pmob_petakgov/widgets/custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FireBaseAuthService _auth = FireBaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  bool _isRememberMe = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  FireBaseAuthService auth = FireBaseAuthService();

  void _signup(String email, password, username) {
    auth.signUpWithEmailAndPassword(email, password, username);
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
                  Image.asset("img/Robot2.png", height: 200),
                  const SizedBox(height: 20),
                  const Text(
                    "Create New Account",
                    style: TextStyle(
                      fontSize: kbigFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      label: const Text("Email Pengguna"),
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
                      label: const Text("Password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      label: const Text("Username"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    color: AppColors.mainColor,
                    textColor: Colors.white,
                    text: "Signup",
                    onPress: () {
                      _auth.signUpWithEmailAndPassword(_emailController.text,
                          _passwordController.text, _usernameController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuccessLoginScreen(),
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
