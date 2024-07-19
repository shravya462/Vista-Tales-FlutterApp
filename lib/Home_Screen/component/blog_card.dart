import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/components/text_widget.dart';
import 'package:project/res/appcolors.dart';
import 'package:project/res/images.dart';

class BlogCard extends StatelessWidget {
  final String cityName;
  final String placeName;
  final String period;
  const BlogCard(
      {super.key,
      required this.cityName,
      required this.placeName,
      required this.period});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      child: Column(
        children: [
          Image.asset(
            Images.splashImage,
            width: 100,
            height: 100,
          ),
          TextWidget(
              txtTitle: "${cityName} - ${placeName}",
              txtColor: Appcolors.black,
              txtFontStyle: FontWeight.normal,
              txtFontSize: 24),
          TextWidget(
              txtTitle: period,
              txtColor: Appcolors.black,
              txtFontStyle: FontWeight.normal,
              txtFontSize: 24)
        ],
      ),
    );
  }
}
