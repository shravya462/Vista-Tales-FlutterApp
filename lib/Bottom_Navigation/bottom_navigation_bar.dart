import 'package:flutter/material.dart';
import 'package:project/Blog_Upload_Screen/blog_upload_screen.dart';
import 'package:project/Home_Screen/home_screen.dart';
import 'package:project/Profile_Screen/profile_screen.dart';
import 'package:project/res/appcolors.dart';

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
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                activeIcon: Icon(
                  Icons.add,
                  size: 30,
                ),
                label: "Blog",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                activeIcon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
