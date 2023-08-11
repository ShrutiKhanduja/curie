import 'package:curie_money/constants/colors.dart';
import 'package:curie_money/user_pay/ui/views/user_pin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProceedToPay extends StatefulWidget {
  final String price;

  const ProceedToPay({Key? key, required this.price}) : super(key: key);

  @override
  State<ProceedToPay> createState() => _ProceedToPayState();
}

class _ProceedToPayState extends State<ProceedToPay> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.18,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: AppColors.onPrimary,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.account_balance,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Your Bank xxxx4321",
                            style: GoogleFonts.workSans(
                                fontSize: 16,
                                color: AppColors.surfaceColor,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.surfaceColor,
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserPin(
                                    userPinLength:
                                        (widget.price.length > 2) ? 6 : 4,
                                    price: widget.price,
                                  )));
                    },
                    child: Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Center(
                          child: Text(
                        "Proceed to pay",
                        style: GoogleFonts.workSans(
                            color: AppColors.onPrimary,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
