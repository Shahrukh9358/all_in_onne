import 'package:flutter/material.dart';
import 'package:realproject/screens/dashboard/all_watchlist/watchlist1/index.dart';
import 'package:realproject/screens/dashboard/botton_navgationbar/bottombar3.dart';
import 'package:realproject/screens/dashboard/botton_navgationbar/bottombar4.dart';
import 'package:realproject/screens/dashboard/botton_navgationbar/home.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});
  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}
class _WatchlistScreenState extends State<WatchlistScreen> {
  List<Widget> screens = [
   const Watchlist1(),
   const BottomBar2(),
   const BottomBar3(),
   const BottomBar4(),
 ];
 int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:   screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){setState(() {
        _selectedIndex = index;
        });
        },
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school),label: "School"),
          BottomNavigationBarItem(icon: Icon(Icons.document_scanner),label: "paper"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "settings"),


      ],),
    );
  }
}
