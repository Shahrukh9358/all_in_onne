import 'package:flutter/material.dart';
class Watchlist4 extends StatefulWidget {
  const Watchlist4({super.key});

  @override
  State<Watchlist4> createState() => _Watchlist4State();
}

class _Watchlist4State extends State<Watchlist4> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text("Waatchlist 4",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),)
      ],
    );
  }
}
