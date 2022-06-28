import 'package:flutter/material.dart';
import 'package:psyco_space/models/app_license_flag_enum.dart';

class AppLicenseFlagWidget extends StatefulWidget {
  final AppLicenseFlagEnum appLicenseFlagEnum;

  const AppLicenseFlagWidget.pro({Key? key})
      : appLicenseFlagEnum = AppLicenseFlagEnum.PRO,
        super(key: key);

  const AppLicenseFlagWidget.demo({Key? key})
      : appLicenseFlagEnum = AppLicenseFlagEnum.DEMO,
        super(key: key);

  @override
  _AppLicenseFlagWidgetState createState() => _AppLicenseFlagWidgetState();
}

class _AppLicenseFlagWidgetState extends State<AppLicenseFlagWidget> {
  @override
  Widget build(BuildContext context) {
    final bool isProLicense =
        widget.appLicenseFlagEnum == AppLicenseFlagEnum.PRO;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: isProLicense ? Colors.white : Colors.transparent,
            width: isProLicense ? 0.8 : 1,
          ),
          color: isProLicense ? Colors.transparent : Colors.blue,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: 20,
        child: isProLicense
            ? const Text(
                'PRO',
                style: TextStyle(
                  fontSize: 12,
                ),
              )
            : const Text(
                'DEMO',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
      ),
    );
  }
}
