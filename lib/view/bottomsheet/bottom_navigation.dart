import 'package:flutter/material.dart';
import 'package:News4you/view/home_screen/home_screen.dart';
import 'package:News4you/view/searchpage/searchpage.dart';

class Bottom_Navigation extends StatefulWidget {
  const Bottom_Navigation({super.key});

  @override
  State<Bottom_Navigation> createState() => _Bottom_NavigationState();
}

class _Bottom_NavigationState extends State<Bottom_Navigation> {
  int index = 0;
  final List<Widget> pages = [home_screen(), search_page()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        onTap: (i) => setState(() {
          index = i;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.feed,
              color: Colors.white,
            ),
            label: 'feed',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search')
        ],
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
