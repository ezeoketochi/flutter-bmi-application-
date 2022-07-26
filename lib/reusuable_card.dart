import 'package:flutter/material.dart';

class Reuseable extends StatelessWidget {
  const Reuseable({
    Key? key,
    required this.cardChild,
    required this.colour,
  }) : super(key: key);

  final Widget cardChild;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
      //color: const  Color(0xFF1D1E33),
      height: 250,
      width: double.maxFinite,
      child: cardChild,
    );
  }
}
