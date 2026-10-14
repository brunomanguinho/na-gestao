import 'package:flutter/material.dart';
import 'package:gestao/config/app_colors.dart';
import 'package:gestao/data/sys_current.dart';
import 'package:gestao/ui/components.dart';
import 'package:gestao/utils/date_utils.dart';

TextStyle titleStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.w800,
);

TextStyle headerFontStyle = TextStyle(
  color: Colors.white,
  fontSize: 12,
  fontStyle: FontStyle.normal,
);

TextStyle greetingFontStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.w800,
);

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({
    super.key,
    required this.title,
    this.greeting,
    this.infoText,
    this.showDate = true,
  });

  final String title;
  final String? greeting;
  final String? infoText;
  final bool showDate;

  String get _greeting =>
      greeting ??
      (showDate
          ? '${DateTimeUtils.getSaudacao(DateTime.now())}, ${SysCurrent.username}'
          : SysCurrent.username.toString()); // Ex.: Bom dia/Boa tarde, Fulano.

  String get _infoText =>
      infoText ?? 'Definir ou excluir informação ao usuário'; //Ex.: Algumas atividades precisam de sua atenção

  Widget? dataExtensa() {
    return showDate ? Text(DateTimeUtils.getDataExtensa(DateTime.now())) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.navy,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, 24, 24, 68),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FavIcon(),
              Text(title, style: titleStyle),
              NotificationButton(onPressed: () {}),
            ],
          ),
          SizedBox(height: 18),
          showDate
              ? Text(
                  DateTimeUtils.getDataExtensa(DateTime.now()),
                  style: headerFontStyle,
                )
              : SizedBox.shrink(),
          SizedBox(height: 18),
          Text(_greeting, style: greetingFontStyle),
          SizedBox(height: 18),
          Text(_infoText, style: headerFontStyle),
        ],
      ),
    );
  }
}
