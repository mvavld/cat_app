// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:cat_app/di/injection.dart';
import 'package:cat_app/localization/app_localizations.dart';
import 'package:cat_app/presentation/splash/bloc/splash_bloc.dart';
import 'package:cat_app/presentation/splash/splash_screen.dart';
import 'package:cat_app/resources/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) => KeyboardDismissOnTap(
        child: OverlaySupport.global(
          child: MaterialApp(
            navigatorKey: navigatorKey,
            theme: AppThemes.appTheme,
            locale: const Locale('en'),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
              AppLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ru'),
              Locale('en'),
            ],
            home: BlocProvider(
              create: (BuildContext context) =>
                  SplashBloc(preferencesLocalGateway: injection()),
              child: SplashScreen(navigatorKey: navigatorKey),
            ),
            //home: Container()),
          ),
        ),
      );
}
