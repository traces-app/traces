import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordStrengthMeter extends StatefulWidget {
  final TextEditingController newPasswordController;
  const PasswordStrengthMeter({required this.newPasswordController, super.key});

  @override
  State<PasswordStrengthMeter> createState() => _PasswordStrengthMeterState();
}

class _PasswordStrengthMeterState extends State<PasswordStrengthMeter> {
  List<Color> containerColors =
      List.generate(5, (index) => const Color(0xFF7A7A7A));

  @override
  void initState() {
    super.initState();
    widget.newPasswordController.addListener(changingColors);
  }

  void changingColors() {
    final text = widget.newPasswordController.text;
    final length = text.length;
    final hasUpperCase = RegExp(r'[A-Z]').hasMatch(text);
    final hasNumber = RegExp(r'\d').hasMatch(text);

    bool textLengthCheck6 = length > 6;
    bool capsOrNumCheck = textLengthCheck6 && (hasUpperCase || hasNumber);
    bool capsAndNumCheck = textLengthCheck6 && hasUpperCase && hasNumber;
    bool textLengthCheck10 = capsAndNumCheck && length > 10;
    bool textLengthCheck15 = textLengthCheck10 && length > 15;

    List<Color> newColors = [
      textLengthCheck6,
      capsOrNumCheck,
      capsAndNumCheck,
      textLengthCheck10,
      textLengthCheck15
    ]
        .map((condition) =>
            condition ? const Color(0xFFA8A972) : const Color(0xFF7A7A7A))
        .toList();

    if (newColors.toString() != containerColors.toString()) {
      setState(() {
        containerColors = newColors;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    changingColors();
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      child: Row(
        children: List.generate(5, (index) {
          return Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 5,
              decoration: BoxDecoration(color: containerColors[index]),
            ),
          );
        }),
      ),
    );
  }
}
