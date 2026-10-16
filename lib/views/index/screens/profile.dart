import 'package:flutter/material.dart';
import 'package:gestao/config/app_colors.dart';
import 'package:gestao/config/app_config.dart';
import 'package:gestao/data/sys_current.dart';
import 'package:gestao/views/index/components.dart';

class EmptyAvatar extends StatelessWidget {
  const EmptyAvatar({
    super.key,
    required this.initials,
    required this.width,
    required this.heigth,
  });

  final String initials;
  final double width;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(148, 43, 85, 88),
        borderRadius: BorderRadius.circular(20),
      ),
      width: width,
      height: heigth,
      child: Center(
        child: Text(
          initials,
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

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.name, this.role});

  final String name;
  final String? role;

  String getInitials() {
    List<String> parts = name.split(' ');
    return '${parts[0][0]} ${parts[parts.length - 1][0]}';
  }

  String get _initials => getInitials();

  Widget get _roleWidget => role != null ? Text(role!) : SizedBox.shrink();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.all(20),
                child: EmptyAvatar(initials: _initials, width: 98, heigth: 98),
              ),
              Text(
                name,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              _roleWidget,
            ],
          ),
        ],
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
          child: UserCard(
            name: SysCurrent.username.toString(),
            role: "Analista de T.I. III",
          ),
        ),
      ],
    );
  }
}
