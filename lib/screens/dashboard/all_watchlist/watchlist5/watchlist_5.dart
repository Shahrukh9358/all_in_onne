import 'package:flutter/material.dart';
class Watchlist5 extends StatefulWidget {
  const Watchlist5({super.key});

  @override
  State<Watchlist5> createState() => _Watchlist5State();
}

class _Watchlist5State extends State<Watchlist5> {
  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        Center(child: Text("Watchlist 5",style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),)
      ],
    );;
  }
}
