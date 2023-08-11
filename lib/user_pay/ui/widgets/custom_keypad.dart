import 'package:curie_money/constants/colors.dart';
import 'package:curie_money/user_pay/ui/widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomKeypad extends StatefulWidget {
  final TextEditingController controller;
  final String price;

  const CustomKeypad({super.key, required this.controller,required this.price});

  @override
  State<CustomKeypad> createState() => _CustomKeypadState();
}

class _CustomKeypadState extends State<CustomKeypad> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildButton('1'),
            _buildButton('2'),
            _buildButton('3'),
          ],
        ),
        Row(
          children: [
            _buildButton('4'),
            _buildButton('5'),
            _buildButton('6'),
          ],
        ),
        Row(
          children: [
            _buildButton('7'),
            _buildButton('8'),
            _buildButton('9'),
          ],
        ),
        Row(
          children: [
            _buildButton('⌫', onPressed: _backspace),
            _buildButton('0'),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) =>  CustomLoader(price: widget.price,)));
              },
              child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration:
                      BoxDecoration(color: Colors.grey.withOpacity(0.04)),
                  child: const Icon(
                    Icons.check_circle,
                    color: AppColors.primaryColor,
                    size: 40,
                  )),
            )
          ],
        ),
      ],
    );
  }

  // Individual keys
  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return InkWell(
      onTap: onPressed ?? () => _input(text),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(color: Colors.yellow.withOpacity(0.04)),
        child: Center(
            child: Text(
          text,
          style: GoogleFonts.workSans(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
              fontSize: 22),
        )),
      ),
    );
  }

  void _input(String text) {
    final value = _controller.text + text;
    widget.controller.text = value;
  }

  void _backspace() {
    final value = _controller.text;
    if (value.isNotEmpty) {
      _controller.text = value.substring(0, value.length - 1);
    }
  }
}
