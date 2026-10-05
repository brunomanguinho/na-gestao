import 'package:flutter/material.dart';
import 'package:gestao/views/auth/authenticator.dart';
import 'package:gestao/views/index/view.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('pt_BR', null).then((_) {
    runApp(const MainApp());
  });
}

const navy = Color(0xFF203B42);
const background = Color(0xFFF6F8F6);
const textColor = Color(0xFF263C42);
const green = Color(0xFF4B8378);

class MainApp extends StatefulWidget {
  const new({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(seedColor: navy),
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
      initialRoute: '/',
      routes: {
        '/': (context) => const Authenticator(),
        '/index': (context) => const IndexScreen(),
      },
    );
  }
}
