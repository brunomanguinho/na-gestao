import 'package:flutter/material.dart';
import 'package:gestao/config/app_config.dart';
import 'package:gestao/ui/components.dart';
import 'package:gestao/views/index/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onNavigate});

  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ScreenHeader(title: AppConfig.appName),
          FloatContainer(onTap: () {}, children: []),
        ],
      ),
    );
  }
}
