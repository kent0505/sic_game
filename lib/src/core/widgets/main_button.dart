import 'package:flutter/material.dart';

import 'button.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    this.width,
    this.color,
    this.isActive = true,
    required this.onPressed,
  });

  final String title;
  final double? width;
  final Color? color;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 50,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: Color(0xff898BFF),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff847EFF),
            Color(0xff5D56F6),
          ],
        ),
      ),
      child: Button(
        onPressed: isActive ? onPressed : null,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontSize: 16,
              fontFamily: 'w700',
            ),
          ),
        ),
      ),
    );
  }
}
