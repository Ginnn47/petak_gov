import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmob_petakgov/misc/colors.dart';
import 'package:pmob_petakgov/pages/login/login_page.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height:
          28, // Ganti tinggi button menjadi 50 untuk menampung teks "Click Here!"
      child: isResponsive!
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: _buildButton(context),
                ),
              ],
            )
          : _buildButton(context),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: TextButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeLogin(),
          ),
        ),
        child: Text(
          "Click Here!",
          style: GoogleFonts.poppins(
            fontSize: 8, // Ubah ukuran font menjadi 16
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
