import 'package:flutter/material.dart';
class BottomBar2 extends StatefulWidget {
  const BottomBar2({super.key});

  @override
  State<BottomBar2> createState() => _BottomBar2State();
}

class _BottomBar2State extends State<BottomBar2> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("BOTTOM_BAR 2",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),);
  }
}

