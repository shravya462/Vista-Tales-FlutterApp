import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String txtTitle;
  final Color txtColor;
  final FontWeight txtFontStyle;
  final double txtFontSize;
  final TextAlign? textAlignment;
  final TextOverflow? textOverflow;
  final TextDecoration? underline;
  final bool? wrap;

  TextWidget({
    required this.txtTitle,
    required this.txtColor,
    required this.txtFontStyle,
    required this.txtFontSize,
    this.textAlignment,
    this.textOverflow,
    this.underline,
    this.wrap,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        decoration: underline,
        color: txtColor,
        // fontFamily: Fonts.fontPoppins,
        fontWeight: txtFontStyle,
        fontSize: txtFontSize,
      ),
      child: Text(
        txtTitle,
        softWrap: wrap != null ? wrap : false,
        overflow: textOverflow != null ? textOverflow : TextOverflow.clip,
        textAlign: textAlignment != null ? textAlignment : TextAlign.start,
      ),
    );
  }
}
