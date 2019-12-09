import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'package:planet_cleaner/utils/app_color.dart';

///Big button with gradient that should be used everywhere as default app button
class ButtonPlanet extends StatelessWidget {
  const ButtonPlanet(this.text, this.onTap);

  final String text;

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return NiceButton(
      radius: 30,
      padding: const EdgeInsets.all(15),
      text: text,
      background: AppColor.white,
      gradientColors: [AppColor.yellow, AppColor.lightGreen],
      onPressed: onTap,
    );
  }
}
