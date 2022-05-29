import 'package:flutter/material.dart';

class GenderColumn extends StatelessWidget {
  final IconData? icon;
  final String gender;

  const GenderColumn({Key? key, this.icon, required this.gender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.black54,
          size: 50,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          gender,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
