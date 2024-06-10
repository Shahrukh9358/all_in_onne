import 'package:flutter/material.dart';
class Watchlist1 extends StatefulWidget {
  const Watchlist1({super.key});

  @override
  State<Watchlist1> createState() => _Watchlist1State();
}

class _Watchlist1State extends State<Watchlist1> {
  @override
  Widget build(BuildContext context) {
    return const Center(child:  Center(child: Text("Watchlist 1",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),);
  }
}
