import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/app/widgets/app_hub_widget.dart';
import 'package:psyco_space/controllers/app_authentication_controller.dart';
import 'package:psyco_space/controllers/pacient_controller.dart';
import 'package:psyco_space/controllers/form_controller.dart';
import 'package:psyco_space/controllers/settings_controller.dart';
import 'package:psyco_space/controllers/sign_in_controller.dart';
import 'package:psyco_space/controllers/sign_up_controller.dart';
import 'package:psyco_space/controllers/splash_controller.dart';
import 'package:psyco_space/pages/splash/splash_page.dart';
import 'package:psyco_space/routes.dart';

import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

void buildApplication() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'psyco_space_mobile',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  initializeDateFormatting().then(
    (_) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  void applyAfter(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => callback());
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashController>(
          create: (_) => SplashController(),
        ),
        ChangeNotifierProvider<FormController>(
          create: (_) => FormController(),
        ),
        ChangeNotifierProvider<AppAuthenticationController>(
          create: (_) => AppAuthenticationController(),
        ),
        ChangeNotifierProvider<PacientController>(
          create: (_) => PacientController(),
        ),
        ChangeNotifierProvider<SettingsController>(
          create: (_) => SettingsController(),
        ),
        ChangeNotifierProvider<SignUpController>(
          create: (_) => SignUpController(),
        ),
        ChangeNotifierProvider<SignInController>(
          create: (_) => SignInController(),
        ),
      ],
      builder: (ctx, _) => MaterialApp(
        navigatorKey: _navKey,
        debugShowCheckedModeBanner: false,
        routes: AppPlaces.routes,
        home: const SplashPage(),
        builder: (ctx, appWidget) {
          return AppHubWidget(
            scaffoldKey: _scaffoldKey,
            inAsyncCall: false,
            appWidget: appWidget!,
          );
        },
      ),
    );
  }
}
