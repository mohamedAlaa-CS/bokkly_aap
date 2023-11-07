import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundcolor,
    required this.textColor,
    required this.text,
    this.borderRadius,
    this.fontSize, this.onpressed,
  });
  final Color backgroundcolor;
  final Color textColor;
  final String text;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: backgroundcolor,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(12),
              )),
          onPressed: onpressed,
          child: Text(
            text,
            style: Styles.textStyle20.copyWith(
              color: textColor,
              fontSize: fontSize,
            ),
          )),
    );
  }
}
