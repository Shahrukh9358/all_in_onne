import 'package:flutter/material.dart';
import 'package:realproject/screens/dashboard/all_watchlist/index.dart';
import 'package:realproject/screens/dashboard/botton_navgationbar/bottombar3.dart';
import 'package:realproject/screens/dashboard/botton_navgationbar/bottombar4.dart';
import 'package:realproject/screens/dashboard/botton_navgationbar/buttombar2.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});
  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}
class _WatchlistScreenState extends State<WatchlistScreen> {
  List<Widget> screens = [
   const WatchlistHome(),
   const BottomBar2(),
   const BottomBar3(),
   const BottomBar4(),
 ];
 int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:   screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){setState(() {
        _selectedIndex = index;
        });
        },
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border),label: "Order"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: "Portfolio"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),


      ],),
    );
  }
}
