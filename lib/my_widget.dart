import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final Color? color;
  final Widget? child;

  const MyWidget({Key? key, this.color, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color,
      ),
    );
  }
}
