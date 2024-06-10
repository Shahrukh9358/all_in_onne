import 'package:flutter/material.dart';
class BottomBar4 extends StatefulWidget {
  const BottomBar4({super.key});

  @override
  State<BottomBar4> createState() => _BottomBar4State();
}

class _BottomBar4State extends State<BottomBar4> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("bottom bar 4",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),);
  }
}
