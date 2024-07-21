import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/Home_Screen/component/blog_card.dart';
import 'package:project/components/text_widget.dart';
import 'package:project/providers/blog_provider.dart';

import 'dart:io';

import 'package:project/res/appcolors.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogs = ref.watch(blogProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 59,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
                txtTitle: "Hello,",
                txtColor: Appcolors.black,
                txtFontStyle: FontWeight.normal,
                txtFontSize: 24),
          ],
        ),
        actions: [],
      ),
      body: blogs.isEmpty
          ? Center(child: Text('No blogs available'))
          : ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                final blog = blogs[index];
                print("blog.imagePath :${blog.imagePath}");
                return BlogCard(
                  cityName: blog.city,
                  placeName: blog.place,
                  imgpath: blog.imagePath,
                );
              }),
    );
  }
}
