import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    required this.yourIcon,
    required this.text,
    Key? key,
  }) : super(key: key);

  final IconData yourIcon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          yourIcon,
          color: Colors.white,
          size: 100,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
