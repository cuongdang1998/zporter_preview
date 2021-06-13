import 'package:flutter/material.dart';

class CircleBorderSplashButton extends StatelessWidget {
  final VoidCallback onTap;
  final double padding;
  final Widget icon;

  const CircleBorderSplashButton({
    Key? key,
    required this.onTap,
    this.padding = 15,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: CircleBorder(),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: icon,
        ),
      ),
    );
  }
}
