import 'package:flutter/material.dart';
class Watchlist3 extends StatefulWidget {
  const Watchlist3({super.key});

  @override
  State<Watchlist3> createState() => _Watchlist3State();
}

class _Watchlist3State extends State<Watchlist3> {
  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        Center(child: Text("Watchlist 3",style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),)
      ],
    );;
  }
}
