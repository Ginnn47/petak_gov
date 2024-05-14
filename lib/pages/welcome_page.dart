import 'package:flutter/material.dart';
import 'package:pmob_petakgov/misc/colors.dart';
import 'package:pmob_petakgov/widgets/app_large_text.dart';
import 'package:pmob_petakgov/widgets/app_text.dart';
import 'package:pmob_petakgov/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "1.png",
    "2.png",
    "3.png",
  ];
  List text1 = [
    "Petak-See",
    "Petak-Search",
    "Petak-Support",
  ];
  List text2 = [
    "Jelajahi projek-projek Pemerintahan di sekitar anda !",
    "Carilah projek pemerintahan yang kamu inginkan !",
    "Berikan feedback hasil projek kepada pemerintah !",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("img/" + images[index]),
                  fit: BoxFit.fitHeight),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 120, left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      AppLargeText(
                        text: text1[index],
                        size: 35,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        width: 200,
                        child: Center(
                          child: AppText(
                            text: text2[index],
                            color: AppColors.bigTextColor,
                            size: 10,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(),
                      SizedBox(
                        height: 5,
                      ),
                      ResponsiveButton(
                        width: 70,
                      )
                    ],
                  ),
                  Column(
                    children: List.generate(
                      3,
                      (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 7,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.4),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
