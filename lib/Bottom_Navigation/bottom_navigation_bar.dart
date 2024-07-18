import 'package:flutter/material.dart';
import 'package:project/Blog_Upload_Screen/blog_upload_screen.dart';
import 'package:project/Home_Screen/home_screen.dart';
import 'package:project/Profile_Screen/profile_screen.dart';
import 'package:project/components/text_widget.dart';
import 'package:project/res/appcolors.dart';
import 'package:project/res/images.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);
  final _page = [
    const HomeScreen(),
    const BlogUploadScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 59,
        backgroundColor: Appcolors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // Image.asset(
            //   Images.appicon,
            // ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWidget(
                          txtTitle: "dksdj",
                          txtColor: Appcolors.white,
                          txtFontStyle: FontWeight.w500,
                          txtFontSize: 14),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [],
      ),
      body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _page[index];
          }),
      bottomNavigationBar:
          BottomNavigationWidget(indexChangeNotifier: indexChangeNotifier),
    );
  }
}

class BottomNavigationWidget extends StatelessWidget {
  final ValueNotifier<int> indexChangeNotifier;
  const BottomNavigationWidget({super.key, required this.indexChangeNotifier});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return Theme(
          data: Theme.of(context).copyWith(
            splashColor: Appcolors.primaryColor,
            highlightColor: Appcolors.primaryColor,
          ),
          child: BottomNavigationBar(
            backgroundColor: Appcolors.primaryColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            selectedFontSize: 0,
            unselectedFontSize: 0,
            selectedItemColor: Appcolors.white,
            unselectedItemColor: Appcolors.white,
            selectedIconTheme: const IconThemeData(
              color: Appcolors.white,
            ),
            unselectedIconTheme: const IconThemeData(
              color: Appcolors.white,
            ),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(height: 44, width: 158, child: Icon(Icons.home)),
                activeIcon: Container(
                    height: 44,
                    width: 158,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(
                    //     7,
                    //   ),
                    //   color: Appcolors.white,
                    // ),
                    child: Icon(Icons.home)),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                    height: 44,
                    width: 158,
                    child: Icon(Icons.add_circle_outline)),
                activeIcon: Container(
                    height: 44,
                    width: 158,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(
                    //     7,
                    //   ),
                    //   color: Appcolors.black,
                    // ),
                    child: Icon(Icons.create)),
                label: "Blog",
              ),
              BottomNavigationBarItem(
                icon:
                    SizedBox(height: 44, width: 158, child: Icon(Icons.person)),
                activeIcon: Container(
                    height: 44,
                    width: 158,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(
                    //     7,
                    //   ),
                    //   color: Appcolors.black,
                    // ),
                    child: Icon(Icons.person)),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
