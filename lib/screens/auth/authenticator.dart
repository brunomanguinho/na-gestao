import 'package:flutter/material.dart';
import 'package:gestao/data/sys_current.dart';
import 'package:gestao/screens/index/view.dart';
import 'package:gestao/screens/login/model.dart';
import 'package:gestao/screens/login/view.dart';
import 'package:gestao/ui/components.dart';

class Authenticator extends StatefulWidget {
  const new({super.key});

  @override
  State<Authenticator> createState() => _AuthenticatorState();
}

class _AuthenticatorState extends State<Authenticator> {
  bool _loading = true;

  Future<void> _restoreSession() async {
    await AuthService().restoreSession();

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _restoreSession();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? CustomCircularProgressIndicator()
        : SysCurrent.token == null
        ? LoginScreen()
        : IndexScreen();
  }
}
