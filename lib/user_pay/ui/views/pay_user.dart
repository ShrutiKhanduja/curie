import 'package:curie_money/constants/colors.dart';
import 'package:curie_money/user_pay/ui/widgets/primary_text_field.dart';
import 'package:curie_money/user_pay/ui/widgets/proceed_to_pay_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PayUser extends StatefulWidget {
  const PayUser({Key? key}) : super(key: key);

  @override
  State<PayUser> createState() => _PayUserState();
}

class _PayUserState extends State<PayUser> {
  TextEditingController priceController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          iconTheme: IconThemeData(color: AppColors.onPrimary),
          actions: [Icon(Icons.more_vert, color: AppColors.onPrimary)],
        ),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.onPrimary,
                        child: CircleAvatar(
                            radius: 38,
                            backgroundColor:
                                AppColors.primaryColor.withOpacity(0.3),
                            child: Text(
                              "SK",
                              style: GoogleFonts.workSans(
                                  color: AppColors.surfaceColor,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.onPrimary,
                      ),
                      const SizedBox(width: 4),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.onPrimary,
                        child: CircleAvatar(
                            radius: 38,
                            backgroundColor:
                                AppColors.primaryColor.withOpacity(0.3),
                            child: Text(
                              "JP",
                              style: GoogleFonts.workSans(
                                  color: AppColors.surfaceColor,
                                  fontWeight: FontWeight.w500),
                            )),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Payment to Jaideep Parsad",
                    style: GoogleFonts.workSans(color: AppColors.onPrimary),
                  ),
                  Text("(jaixxx@xxx)",
                      style: GoogleFonts.workSans(color: AppColors.onPrimary)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "₹",
                        style: GoogleFonts.workSans(color: Colors.white),
                      ),
                      ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.5,
                            minWidth: MediaQuery.of(context).size.width * 0.4,
                          ),
                          child: PrimaryTextField(
                           onSubmitted: (val){
                             priceController.text=val!;
                           },
                           keyboardType: TextInputType.number,
                            hintText: "0",
                            autoFocus: true,
                            textEditingController: priceController,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: ProceedToPay(
                price:(priceController.text.isEmpty)?"0":priceController.text),
          )
        ]));
  }
}
