import 'package:flutter/material.dart';
import 'package:gestao/config/app_colors.dart';
import 'package:gestao/config/app_config.dart';
import 'package:gestao/main.dart';
import 'package:gestao/ui/components.dart';
import 'package:gestao/utils/date_utils.dart';
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
          FloatContainer(onTap: () {}, children: [Text("Texto aqui")]),

          // Transform.translate(
          //   offset: const Offset(0, -30),
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 20),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         InkWell(
          //           onTap: () => {},
          //           child: Container(
          //             width: double.infinity,
          //             padding: const EdgeInsets.all(20),
          //             decoration: BoxDecoration(
          //               color: const Color(0xFFFFF8F1),
          //               borderRadius: BorderRadius.circular(20),
          //               border: Border.all(color: const Color(0xFFF0DCCC)),
          //             ),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
