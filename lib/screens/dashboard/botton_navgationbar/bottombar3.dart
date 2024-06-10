import 'package:flutter/material.dart';
class BottomBar3 extends StatefulWidget {
  const BottomBar3({super.key});

  @override
  State<BottomBar3> createState() => _BottomBar3State();
}

class _BottomBar3State extends State<BottomBar3> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Bottom bar 3",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
    );;
  }
}

