import 'package:flutter/material.dart';
import 'package:gestao/data/sys_current.dart';
import 'package:gestao/screens/index/view.dart';
import 'package:gestao/screens/login/model.dart';
import 'package:gestao/screens/login/view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const new({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey.shade400,
          ),
        ),
        inputDecorationTheme: InputDecorationThemeData(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
      home: _loading
          ? const CircularProgressIndicator()
          : SysCurrent.token == null
          ? LoginScreen()
          : IndexScreen(),
    );
  }
}
