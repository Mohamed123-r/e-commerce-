import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
      selectedIndex: _selectedIndex,
      showElevation: true,
      onItemSelected: (index) => setState(() {
        _selectedIndex = index;
      }),
      items: [
        FlashyTabBarItem(icon: Icon(Icons.event), title: Text('Events')),
        FlashyTabBarItem(icon: Icon(Icons.search), title: Text('Search')),
        FlashyTabBarItem(
          icon: Icon(Icons.highlight),
          title: Text('Highlights'),
        ),
        FlashyTabBarItem(icon: Icon(Icons.settings), title: Text('Settings')),
        FlashyTabBarItem(icon: Icon(Icons.settings), title: Text('한국어')),
      ],
    );
  }
}
