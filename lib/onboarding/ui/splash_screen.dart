import 'package:curie_money/constants/colors.dart';
import 'package:curie_money/user_pay/ui/views/user_history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const UserHistory()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Curie Money",
                  style: GoogleFonts.workSans(
                      color: AppColors.surfaceColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            Text("Earn better returns than your bank account",
                style: GoogleFonts.workSans(color: Colors.grey, fontSize: 14)),
            Image.asset("assets/gif/onboarding.gif")
          ],
        ));
  }
}
