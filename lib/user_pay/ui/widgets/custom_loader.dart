import 'dart:math';

import 'package:curie_money/constants/colors.dart';
import 'package:curie_money/user_pay/ui/views/transaction_success.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLoader extends StatefulWidget {
  final String price;
  const CustomLoader({Key? key,required this.price}) : super(key: key);

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationRotation;
  late Animation<double> animationRadiusIn;
  late Animation<double> animationRadiusOut;
  double radius = 0;
  final double initialRadius = 40;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animationRotation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.linear)));
    animationRadiusIn = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.75, 1.0, curve: Curves.elasticIn)));

    animationRadiusOut = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.25, curve: Curves.elasticOut)));
    controller.addListener(() {

      setState(() {
        if (controller.value >= 0.75 && controller.value < 1.0) {
          radius = animationRadiusIn.value * initialRadius;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = animationRadiusOut.value * initialRadius;
        }
      });
    });
    controller.repeat();

    Future.delayed(const Duration(seconds: 4)).then((value) {
      controller.stop();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>  TransactionSuccess(price: widget.price,)));
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Center(
                  child: RotationTransition(
                turns: animationRotation,
                child: Stack(
                  children: [
                    const Dot(
                      radius: 40,
                      color: AppColors.primaryColor,
                    ),
                    Transform.translate(
                        offset:
                            Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                        child: Dot(
                          radius: 5.0,
                          color: AppColors.primaryColor.withOpacity(0.4),
                        )),
                    Transform.translate(
                        offset: Offset(
                            radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                        child: Dot(
                          radius: 5.0,
                          color: AppColors.primaryColor.withOpacity(0.4),
                        )),
                    Transform.translate(
                        offset: Offset(
                            radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                        child: Dot(
                          radius: 5.0,
                          color: AppColors.primaryColor.withOpacity(0.4),
                        )),
                    Transform.translate(
                        offset: Offset(
                            radius * cos(4 * pi / 4), radius * sin(4 * pi / 4)),
                        child: Dot(
                          radius: 5.0,
                          color: AppColors.primaryColor.withOpacity(0.4),
                        )),
                    Transform.translate(
                        offset: Offset(
                            radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                        child: Dot(
                          radius: 5.0,
                          color: AppColors.primaryColor.withOpacity(0.4),
                        )),
                    Transform.translate(
                        offset: Offset(
                            radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                        child: Dot(
                          radius: 5.0,
                          color: AppColors.primaryColor.withOpacity(0.4),
                        )),
                    Transform.translate(
                        offset: Offset(
                            radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                        child: Dot(
                          radius: 5.0,
                          color: AppColors.primaryColor.withOpacity(0.4),
                        )),
                    Transform.translate(
                        offset: Offset(
                            radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                        child: Dot(
                          radius: 5.0,
                          color: AppColors.primaryColor.withOpacity(0.4),
                        ))
                  ],
                ),
              )),
            ),
            const SizedBox(height: 20),
            Text("Connecting Securely",
                style: GoogleFonts.workSans(
                    color: AppColors.surfaceColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 22))
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  const Dot({Key? key, required this.radius, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
