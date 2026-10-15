import 'package:flutter/material.dart';
import 'package:gestao/config/app_colors.dart';
import 'package:gestao/config/app_config.dart';
import 'package:gestao/data/sys_current.dart';
import 'package:gestao/views/index/components.dart';

class EmptyAvatar extends StatelessWidget {
  const EmptyAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(148, 43, 85, 88),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 98,
      height: 98,
      child: Center(
        child: Text(
          "B M",
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScreenHeader(
          title: AppConfig.appName,
          infoText: 'Meu perfil',
          showDate: false,
        ),
        Padding(
          padding: EdgeInsetsGeometry.all(30),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.all(20),
                      child: EmptyAvatar(),
                    ),
                    Text(
                      SysCurrent.username.toString(),
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text("Analista de T.I."),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
