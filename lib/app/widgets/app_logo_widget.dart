import 'package:flutter/material.dart';
import 'package:psyco_space/theme/app_colors.dart';

enum LogotipoType {
  dark,
  light,
}

class AppLogoWidget extends StatelessWidget {
  final LogotipoType type;
  final double? fontSize;
  const AppLogoWidget({
    Key? key,
    required this.type,
    this.fontSize,
  }) : super(key: key);

  const AppLogoWidget.dark({
    Key? key,
    this.fontSize,
  })  : type = LogotipoType.dark,
        super(key: key);

  const AppLogoWidget.light({
    Key? key,
    this.fontSize,
  })  : type = LogotipoType.light,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          style: TextStyle(
            fontSize: fontSize ?? 17,
            fontFamily: 'Bw-ExtraBold',
            color: type == LogotipoType.light
                ? Colors.white
                : Colors.black.withOpacity(0.7),
          ),
          text: 'Psyco',
          children: [
            TextSpan(
              text: 'Space',
              style: TextStyle(
                  fontFamily: 'Bw-ExtraBold', color: AppColors.primary),
            )
          ]),
    );
  }
}
