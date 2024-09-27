import 'package:flutter/material.dart';

class MEalItemTrait extends StatelessWidget{
  const MEalItemTrait({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
    Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon,size: 17,color: Colors.white,),
        Text(label,style: TextStyle(color: Colors.white),)
      ],
    );
  }
}