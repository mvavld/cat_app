import 'package:cat_app/core/network/dio_helper.dart';
import 'package:cat_app/core/network/network_info.dart';
import 'package:cat_app/data/gateways/cat_remote_gateway.dart';
import 'package:cat_app/data/gateways/preferences_local_gateway.dart';
import 'package:cat_app/data/repositories/cat_repository.dart';
import 'package:cat_app/localization/app_localizations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

GetIt injection = GetIt.I;

Future<void> setUpLocatorWithContext(BuildContext context) async {
  injection.registerSingleton<AppLocalizations>(AppLocalizations.of(context));
}

Future setUpLocator() async {
  injection
    ..registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage())
    ..registerSingleton<PreferencesLocalGateway>(
      PreferencesLocalGateway(flutterSecureStorage: injection()),
    );
}

Future setUpLocatorWithDependencies({
  required BuildContext context,
  required GlobalKey<NavigatorState> navigatorKey,
}) async {
  injection
    ..registerSingleton<AppLocalizations>(AppLocalizations.of(context))
    ..registerSingleton<Dio>(DioHelper.getDio())
    ..registerSingleton<NetworkInfo>(NetworkInfoImpl())
    ..registerSingleton<CatRemoteGateway>(
      CatRemoteGateway(
        dio: injection(),
      ),
    )
    ..registerLazySingleton<CatRepository>(
      () => CatRepository(
        injection(),
        catRemoteGateway: injection(),
      ),
    );
}
