import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../utils.dart';
import 'button.dart';

class InternetWidget extends StatefulWidget {
  const InternetWidget({super.key, required this.child});

  final Widget child;

  @override
  State<InternetWidget> createState() => _InternetWidgetState();
}

class _InternetWidgetState extends State<InternetWidget> {
  final _connectivity = Connectivity();

  bool connected = true;
  bool dialog = false;

  void listen() {
    _connectivity.onConnectivityChanged.listen((result) {
      setState(() {
        logger('LISTENING CONNECTION...');
        if (result.contains(ConnectivityResult.mobile) ||
            result.contains(ConnectivityResult.wifi)) {
          logger('HAS INTERNET');
          connected = true;
          dialog = false;
        } else {
          logger('NO INTERNET');
          connected = false;
          dialog = true;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    listen();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (dialog) ...[
          GestureDetector(
            onTap: () {
              logger('TAP');
            },
          ),
          Container(
            height: 60 + MediaQuery.of(context).viewPadding.top,
            color: Color(0xffD90A0A),
            padding: EdgeInsets.only(bottom: 10),
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                SizedBox(width: 16),
                Text(
                  'No Internet Connection!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'w600',
                  ),
                ),
                Spacer(),
                Button(
                  onPressed: () {},
                  child: Text(
                    'Retry',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'w600',
                    ),
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
        ]
      ],
    );
  }
}
