import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../core/utils.dart';

class InternetWidget extends StatefulWidget {
  const InternetWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<InternetWidget> createState() => _InternetWidgetState();
}

class _InternetWidgetState extends State<InternetWidget> {
  final _connectivity = Connectivity();

  bool connected = true;
  bool dialog = false;

  @override
  void initState() {
    super.initState();
    _connectivity.onConnectivityChanged.listen((result) {
      logger('LISTENING CONNECTION...');
      if (result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi)) {
        connected = true;
        logger('HAS INTERNET');
        if (dialog && mounted) Navigator.pop(context);
        dialog = false;
      } else {
        logger('NO INTERNET');
        connected = false;
        dialog = true;
        if (mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const _Dialog();
            },
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class _Dialog extends StatelessWidget {
  const _Dialog();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: const Dialog(
        backgroundColor: Colors.greenAccent,
        child: SizedBox(
          height: 150,
          width: 200,
          child: Center(
            child: Text(
              'No Internet',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
