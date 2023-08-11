import 'package:curie_money/constants/colors.dart';
import 'package:curie_money/user_pay/ui/widgets/custom_keypad.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class UserPin extends StatefulWidget {
  final String price;
  final int userPinLength;
  const UserPin({Key? key,required this.userPinLength,required this.price}) : super(key: key);

  @override
  State<UserPin> createState() => _UserPinState();
}

class _UserPinState extends State<UserPin> {
  ValueNotifier<bool> obscureText = ValueNotifier(true);
  TextEditingController pinController=TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: GoogleFonts.poppins(
      fontSize: 22,
      color: const Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: const BoxDecoration(),
  );

  final cursor = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 56,
        height: 3,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ],
  );
  final preFilledWidget = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 56,
        height: 3,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ICICI Bank",
                      style: GoogleFonts.workSans(
                          color: AppColors.surfaceColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    Image.asset(
                      "assets/images/upi.png",
                      height: 80,
                      width: 150,
                    )
                  ],
                ),
              ),
              Container(
                  height: 40,
                  color: AppColors.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Verve Financial Services",
                          style: GoogleFonts.workSans(
                              fontWeight: FontWeight.w500,
                              color: AppColors.onPrimary,
                              fontSize: 14),
                        ),
                        Row(
                          children: [
                            Text("₹ 1.00",
                                style: GoogleFonts.workSans(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.onPrimary,
                                    fontSize: 14)),
                            const SizedBox(width: 10),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.onPrimary,
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              const SizedBox(height:80),
              ValueListenableBuilder(
                  valueListenable: obscureText,
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ENTER UPI PIN",
                              style: GoogleFonts.workSans(
                                  fontSize: 16,
                                  color: AppColors.surfaceColor.withOpacity(0.4),
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      obscureText.value = !obscureText.value;
                                    },
                                    icon: (obscureText.value)
                                        ? const Icon(
                                      Icons.visibility_off,
                                      color: AppColors.primaryColor,
                                    )
                                        : const Icon(
                                      Icons.visibility,
                                      color: AppColors.primaryColor,
                                    )),
                                (obscureText.value)
                                    ? Text(
                                  "HIDE",
                                  style: GoogleFonts.workSans(
                                      fontSize: 16,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w500
                                  ),
                                )
                                    : Text(
                                  "SHOW",
                                  style: GoogleFonts.workSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryColor),
                                )
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:20.0,right:20),
                          child: Pinput(

                            focusedPinTheme: defaultPinTheme,
                            submittedPinTheme: defaultPinTheme,
                            cursor: cursor,
                            isCursorAnimationEnabled: false,
                            obscureText: obscureText.value,
                            obscuringCharacter: "*",
                            controller: pinController,
                            length: widget.userPinLength,
                            toolbarEnabled: true,
                            autofocus: true,
                            onSubmitted: (val) {
                              // if (val.length == widget.inputLength) {
                              //   widget.onButtonClickFunction();
                              // }
                            },
                            showCursor: false,
                            preFilledWidget: preFilledWidget,

                            keyboardType: TextInputType.none,
                            defaultPinTheme: defaultPinTheme,
                            androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsUserConsentApi,
                            pinAnimationType: PinAnimationType.slide,
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),



          CustomKeypad(controller: pinController,price: widget.price,)
        ],
      ),
    );
  }
}
