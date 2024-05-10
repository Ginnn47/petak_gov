import 'package:flutter/material.dart';
import 'package:pmob_petakgov/misc/colors.dart';
import 'package:pmob_petakgov/pages/login/succes_login_screen.dart';
import 'package:pmob_petakgov/pages/navpages/navbar_page.dart';
import 'package:pmob_petakgov/pages/splash.dart';
import 'package:provider/provider.dart';
import 'package:pmob_petakgov/misc/provider/bookmark_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => BookmarkBloc(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("Building MyApp"); // Memanggil debugPrint di sini
    return MaterialApp(
      title: 'Flutter PetakGov',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
        useMaterial3: true,
        primarySwatch: Colors.red,
      ),
      routes: {
        "/home": (context) => const SplashScreen(),
        "/login": (context) => const SuccessLoginScreen(),
      },
      home: SplashScreen(),
    );
  }
}
