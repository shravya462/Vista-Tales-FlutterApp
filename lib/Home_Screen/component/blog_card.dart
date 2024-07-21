import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/components/text_widget.dart';
import 'package:project/res/appcolors.dart';
import 'package:project/res/images.dart';

class BlogCard extends StatelessWidget {
  final String cityName;
  final String placeName;
  final String imgpath;
  const BlogCard(
      {super.key,
      required this.cityName,
      required this.placeName,
      required this.imgpath});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.file(
            File(imgpath),
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          // CachedNetworkImage(
          //   imageUrl: imgpath,
          //   placeholder: (context, url) => const Center(
          //     child: CircularProgressIndicator(),
          //   ),
          //   errorWidget: (context, url, error) => const Icon(Icons.error),
          //   width: double.infinity,
          //   height: 200,
          //   fit: BoxFit.cover,
          // ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextWidget(
                txtTitle: "${cityName} - ${placeName}",
                txtColor: Appcolors.black,
                txtFontStyle: FontWeight.normal,
                txtFontSize: 16),
          ),
          // TextWidget(
          //     txtTitle: period,
          //     txtColor: Appcolors.black,
          //     txtFontStyle: FontWeight.normal,
          //     txtFontSize: 24)
        ],
      ),
    );
  }
}
