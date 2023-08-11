import 'package:curie_money/constants/colors.dart';
import 'package:curie_money/user_pay/ui/views/user_history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionSuccess extends StatefulWidget {
  final String price;

  const TransactionSuccess({Key? key, required this.price}) : super(key: key);

  @override
  State<TransactionSuccess> createState() => _TransactionSuccessState();
}

class _TransactionSuccessState extends State<TransactionSuccess>
    with TickerProviderStateMixin {
  late AnimationController rotateController;
  late Animation<double> rotateAnimation;
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    rotateController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: rotateController,
        curve: const Interval(0.0, 1.0, curve: Curves.linear)));

    scaleController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: scaleController,
        curve: const Interval(0.0, 1.0, curve: Curves.linear)));
    rotateController.forward();
    scaleController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    rotateController.dispose();
    scaleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RotationTransition(
              turns: rotateAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: Center(
                  child: Icon(
                    Icons.check_circle,
                    color: AppColors.onPrimary,
                    size: 200,
                  ),
                ),
              ),
            ),
            Text(
              "₹ ${widget.price} paid",
              style: GoogleFonts.workSans(
                  color: AppColors.onPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Text(
              "Jaideep Parsad",
              style: GoogleFonts.workSans(
                  color: AppColors.onPrimary, fontSize: 16),
            ),
            Text("jaixxx@xx",
                style: GoogleFonts.workSans(
                    color: AppColors.onPrimary, fontSize: 16)),
            const SizedBox(height: 40),
            InkWell(
              onTap: () {
               Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    color: AppColors.onPrimary.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Center(
                    child: Text("Done",
                        style: GoogleFonts.workSans(
                            color: AppColors.onPrimary, fontSize: 16))),
              ),
            )
          ],
        ));
  }
}
