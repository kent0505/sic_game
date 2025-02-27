import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibration/vibration.dart';

import '../../../core/config/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../../core/widgets/switch_button.dart';
import '../../game/bloc/game_bloc.dart';
import 'privacy_screen.dart';
import 'terms_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 68 + MediaQuery.of(context).viewPadding.top),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              _SectionCard(
                title: 'General',
                children: [
                  _VibranceButton(),
                  SizedBox(height: 12),
                  _SettingsButton(
                    title: 'Notifications',
                    asset: Assets.set2,
                    onPressed: () {
                      AppSettings.openAppSettings(
                        type: AppSettingsType.notification,
                      );
                    },
                  ),
                  SizedBox(height: 12),
                  _SettingsButton(
                    title: 'Privacy Policy',
                    asset: Assets.set3,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return PrivacyScreen();
                        }),
                      );
                    },
                  ),
                  SizedBox(height: 12),
                  _SettingsButton(
                    title: 'Terms of use',
                    asset: Assets.set4,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return TermsScreen();
                        }),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              _SectionCard(
                title: 'Feedback',
                children: [
                  _SettingsButton(
                    title: 'Share this app',
                    asset: Assets.set5,
                    onPressed: () {},
                  ),
                  SizedBox(height: 12),
                  _SettingsButton(
                    title: 'Rate us',
                    asset: Assets.set6,
                    onPressed: () {},
                  ),
                  SizedBox(height: 12),
                  _SettingsButton(
                    title: 'Clear data',
                    asset: '',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return _ClearDialog();
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xff1B0159),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xff776B95),
              fontSize: 14,
              fontFamily: 'w300',
            ),
          ),
          SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({
    required this.title,
    required this.asset,
    required this.onPressed,
  });

  final String title;
  final String asset;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Color(0xff270B6A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Button(
        onPressed: onPressed,
        child: Row(
          children: [
            if (asset.isNotEmpty) ...[
              SizedBox(width: 12),
              SvgWidget(asset),
            ],
            SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'w600',
                ),
              ),
            ),
            SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

class _VibranceButton extends StatefulWidget {
  const _VibranceButton();

  @override
  State<_VibranceButton> createState() => _VibranceButtonState();
}

class _VibranceButtonState extends State<_VibranceButton> {
  bool active = false;

  void onSwitch() async {
    if (await Vibration.hasVibrator()) Vibration.vibrate(duration: 100);
    setState(() {
      active = !active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Color(0xff270B6A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Button(
        onPressed: onSwitch,
        child: Row(
          children: [
            SizedBox(width: 12),
            SvgWidget(Assets.set1),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Vibrance',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'w600',
                ),
              ),
            ),
            SwitchButton(active: active),
            SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

class _ClearDialog extends StatelessWidget {
  const _ClearDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xff1E1E1E).withValues(alpha: 0.95),
      child: SizedBox(
        height: 140,
        width: 270,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16),
            Text(
              'Clear Data?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'w600',
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: Button(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xff0A84FF),
                          fontSize: 16,
                          fontFamily: 'w600',
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Button(
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<GameBloc>().add(ClearData());
                    },
                    child: Center(
                      child: Text(
                        'Clear',
                        style: TextStyle(
                          color: Color(0xffD90A0A),
                          fontSize: 16,
                          fontFamily: 'w600',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
