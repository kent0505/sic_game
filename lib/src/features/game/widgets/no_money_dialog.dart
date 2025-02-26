import 'package:flutter/material.dart';

import '../../../core/widgets/button.dart';

class NoMoneyDialog extends StatelessWidget {
  const NoMoneyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xff1E1E1E).withValues(alpha: 0.95),
      child: SizedBox(
        width: 270,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16),
            Text(
              'Not Enough Money',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'w600',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'You don\'t have enough funds to proceed. To continue, tap on your balance at the top of the screen to add more money.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'w300',
                ),
              ),
            ),
            Button(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Color(0xff0A84FF),
                    fontSize: 16,
                    fontFamily: 'w600',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
