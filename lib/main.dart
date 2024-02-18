import 'package:flash_task/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'common/screen_utils/screen_util.dart';
import 'common/themes/theme_color.dart';
import 'currency_exchange/di/_init_all_di_currency_exchange.dart';
import 'gold_exchange/di/_init_all_di_currency_exchange.dart';

void main() async {
  /// ensureInitialized
  WidgetsFlutterBinding.ensureInitialized();

  /// init screen util
  ScreenUtil.init();

  /// init _Currency_ Exchange Dependencies
  initCurrencyExchangeDependencies();

  /// init _Gold_ Exchange Dependencies
  initGoldExchangeDependencies();

  /// load the env file
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// title
      title: 'Trade',

      ///
      ///
      /// theme data
      ///
      theme: ThemeData(
        /// pageTransitionsTheme
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),

        /// appBar theme
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.white,
          elevation: 0.0,
          centerTitle: true,
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
          iconTheme: const IconThemeData(color: AppColor.primaryDarkColor),
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.transparent,

            // Status bar brightness (optional)
            statusBarIconBrightness: Brightness.dark,
            // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
        ),

        /// scaffoldBackgroundColor
        scaffoldBackgroundColor: Colors.white,

        /// default card theme
        cardTheme: const CardTheme(
          elevation: 6.0,
          shadowColor: AppColor.fadeBlue,
        ),
      ),

      ///
      ///
      /// home
      ///
      home: const HomeScreen(),
    );
  }
}
