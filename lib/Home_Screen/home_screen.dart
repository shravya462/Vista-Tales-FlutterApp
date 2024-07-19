import 'package:flutter/material.dart';
import 'package:project/Home_Screen/component/blog_card.dart';
import 'package:project/components/text_widget.dart';
import 'package:project/res/appcolors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(itemBuilder: (context, index) {
        return BlogCard(
          cityName: 'City',
          placeName: 'Place',
          period: '5 Days ago',
        );
      }),
    );
  }
}
