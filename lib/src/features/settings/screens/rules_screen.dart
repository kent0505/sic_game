import 'package:flutter/material.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 68 + MediaQuery.of(context).viewPadding.top),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Text(
                'Sic Bo is an ancient Chinese dice game that’s played on a large table. It’s a game of pure chance that moves quickly. There’s no strategy or skill involved.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'w600',
                ),
              ),
              SizedBox(height: 20),
              _Text16('1. Placing Bets'),
              SizedBox(height: 12),
              _Text14(
                  'Players place their bets on the designated areas on the betting table before the dice are rolled. You can bet on specific dice combinations, totals, or individual numbers. Once all bets are placed, the dealer will roll the three dice.'),
              SizedBox(height: 20),
              _Text16('2. Dice Rolls'),
              SizedBox(height: 12),
              _Text14(
                  'Three dice will be rolled and the results will be displayed on the screen. All bets are resolved based on the outcome of the dice roll.'),
              SizedBox(height: 20),
              _Text16('3. Betting Options'),
              SizedBox(height: 12),
              _Text14(
                  'Players can place various types of bets, including:\n- Big/Small: Bet on whether the total of the three dice will be small (4–10) or big (11–17).\n- Specific Total: Bet on a specific total number (e.g., 9, 10, etc.).\n- Single Dice: Bet on one specific number appearing on any of the three dice.\n- Double: Bet that two identical numbers will appear on two of the dice.\n- Triple: Bet that all three dice will show the same number.\n- Combination: Bet on two specific numbers appearing on the dice.'),
              SizedBox(height: 20),
              _Text16('4. Payouts'),
              SizedBox(height: 12),
              _Text14(
                  'Each bet has a specific payout based on the odds. For example, a Big/Small bet has a 1:1 payout, while a Triple bet has a higher payout, depending on the specific triple chosen.\nCheck the payout table within the app to view all possible bets and their corresponding payouts.'),
              SizedBox(height: 20),
              _Text16('5. Winning'),
              SizedBox(height: 12),
              _Text14(
                  'After the dice roll, winning bets will be paid out based on the result.\nIf you win, your winnings will be added to your balance immediately.'),
              SizedBox(height: 20),
              _Text16('6. Losing'),
              SizedBox(height: 12),
              _Text14(
                  'If the outcome does not match your bet, you will lose the amount wagered.\nIn the case of a tie, the bet is returned.'),
              SizedBox(height: 20),
              _Text16('7. Not Enough Money'),
              SizedBox(height: 12),
              _Text14(
                  'If you don\'t have enough funds to proceed. To continue, tap on your balance at the top of the screen to add more money.'),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class _Text16 extends StatelessWidget {
  const _Text16(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'w600',
      ),
    );
  }
}

class _Text14 extends StatelessWidget {
  const _Text14(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily: 'w300',
      ),
    );
  }
}
