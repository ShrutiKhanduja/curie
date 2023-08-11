import 'package:curie_money/constants/colors.dart';
import 'package:curie_money/user_pay/ui/views/pay_user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserHistory extends StatefulWidget {
  const UserHistory({Key? key}) : super(key: key);

  @override
  State<UserHistory> createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onPrimary,
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: Text(
                "JP",
                style: GoogleFonts.workSans(color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jaideep Prasad",
                  style: GoogleFonts.workSans(
                      color: AppColors.surfaceColor, fontSize: 14),
                ),
                Text(
                  "97xxx xxxxx",
                  style: GoogleFonts.workSans(
                      color: Colors.grey.shade400, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.more_vert,
            color: AppColors.surfaceColor,
          )
        ],
        backgroundColor: Colors.grey.shade100,
      ),
      bottomSheet: Container(
        color: AppColors.onPrimary,
        height: 100,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            onTap: (){
             Navigator.push(context,MaterialPageRoute(builder: (context)=>const PayUser()));
            },
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),

                height: 70,
                width: double.maxFinite,
                child: Center(
                    child: Text(
                  "Pay Now",
                  style: GoogleFonts.workSans(
                      color: AppColors.onPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ))),
          ),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
