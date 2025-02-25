import 'package:flutter/material.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key, required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 30,
        width: 50,
        decoration: BoxDecoration(
          color: active ? Color(0xff34C759) : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              top: 2,
              left: active ? 22 : 2,
              child: Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: active ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
