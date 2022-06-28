import 'package:flutter/material.dart';
import 'package:psyco_space/pages/archives/archives_page.dart';
import 'package:psyco_space/pages/history/history_page.dart';
import 'package:psyco_space/pages/pacients/pacients_page.dart';
import 'package:psyco_space/pages/root/root_page.dart';
import 'package:psyco_space/pages/sign_in/sign_in_page.dart';
import 'package:psyco_space/pages/sign_up/sign_up_page.dart';
import 'package:psyco_space/pages/splash/splash_page.dart';
import 'package:psyco_space/pages/welcome/welcome_page.dart';

class AppPlaces {
  static const String kRootPage = '/root';
  static const String kSignInPage = '/sign_in';
  static const String kSignUpPage = '/sign_up';
  static const String kSplashPage = '/splash';
  static const String kWelcomePage = '/welcome';
  static const String kClientsPage = '/clients';
  static const String kArchivePage = '/archive';
  static const String kHistoryPage = '/history-page';

  static Map<String, WidgetBuilder> routes = {
    kSignInPage: (context) => const SignInPage(),
    kSignUpPage: (context) => const SignUpPage(),
    kRootPage: (context) => const RootPage(),
    kSplashPage: (context) => const SplashPage(),
    kWelcomePage: (context) => const WelcomePage(),
    kClientsPage: (context) => const PacientsPage(),
    kArchivePage: (context) => const ArchivesPage(),
    kHistoryPage: (context) => const HistoryPage(),
  };
}
