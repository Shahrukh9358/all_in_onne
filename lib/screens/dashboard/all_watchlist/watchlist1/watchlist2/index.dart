import 'package:flutter/material.dart';
class Watchlist2 extends StatefulWidget {
  const Watchlist2({super.key});

  @override
  State<Watchlist2> createState() => _Watchlist2State();
}

class _Watchlist2State extends State<Watchlist2> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("watchlist 2",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),);
  }
}
