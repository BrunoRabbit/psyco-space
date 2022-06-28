import 'package:flutter/material.dart';
import 'package:psyco_space/routes.dart';
import 'package:psyco_space/theme/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 1));
      Navigator.of(context).pushNamed(AppPlaces.kWelcomePage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 2,
          child: SizedBox(),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Image.asset(
                  'assets/images/logo_transparent_cut.png',
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 100,
                ),
                width: MediaQuery.of(context).size.width * 0.6,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation(
                    AppColors.purpleDark,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
