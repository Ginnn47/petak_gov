import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmob_petakgov/misc/colors.dart';
import 'package:pmob_petakgov/pages/login/succes_login_screen.dart';
import 'package:pmob_petakgov/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp()
      // MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider<SearchProvider>(
      //       create: (context) => SearchProvider(),
      //     ),
      //   ],
      //   child: const MyApp(),
      // ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Building MyApp"); // Memanggil debugPrint di sini
    return ProviderScope(
      child: MaterialApp(
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
        home: const SplashScreen(),
      ),
    );
  }
}
