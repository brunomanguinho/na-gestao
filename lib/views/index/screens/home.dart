import 'package:flutter/material.dart';
import 'package:gestao/main.dart';
import 'package:gestao/ui/components.dart';
import 'package:gestao/utils.dart';
import 'package:gestao/views/index/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onNavigate});

  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: navy,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(24, 24, 24, 68),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FavIcon(),
                    Text("Portal da Gestão", style: titleStyle),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_none_rounded,
                        color: Colors.white,
                      ),
                      tooltip: 'Notificações',
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Text(getDataExtensa(DateTime.now()), style: headerFontStyle),
                SizedBox(height: 18),
                Text("Olá, Bruno Manguinho", style: greetingFontStyle),
                SizedBox(height: 18),
                Text("Acompanhe sua gestão aqui.", style: headerFontStyle),
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -30),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => {},
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8F1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFF0DCCC)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
