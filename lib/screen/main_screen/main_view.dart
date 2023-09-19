import 'package:flutter/material.dart';
import 'package:job_application/core/utils/colors.dart';
import 'package:job_application/screen/main_screen/bottom_nav_bar_screen/book_view.dart';
import 'package:job_application/screen/main_screen/bottom_nav_bar_screen/category.dart';
import 'package:job_application/screen/main_screen/bottom_nav_bar_screen/home_view.dart';
import 'package:job_application/screen/main_screen/bottom_nav_bar_screen/message_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> screen = [
    const HomeView(),
    const MessageView(),
    const BookMarkView(),
    const CategoryView()
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorManager.bottomColor2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: ''),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
