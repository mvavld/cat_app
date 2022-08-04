import 'package:cat_app/core/generated/assets.gen.dart';
import 'package:cat_app/core/ui/widgets/base_bloc_state.dart';
import 'package:cat_app/di/injection.dart';
import 'package:cat_app/localization/app_localizations.dart';
import 'package:cat_app/navigation/app_navigator.dart';
import 'package:cat_app/navigation/navigation_action.dart';
import 'package:cat_app/presentation/splash/bloc/splash_bloc.dart';
import 'package:cat_app/resources/app_colors.dart';
import 'package:cat_app/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseBlocState<SplashScreen, SplashBloc> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(AppStyles.darkStyle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocListener<SplashBloc, SplashState>(
        listenWhen: (previous, current) => previous.action != current.action,
        listener: (context, state) async {
          final action = state.action;
          if (action is NavigateAction) {
            await setUpLocatorWithDependencies(
              context: context,
              navigatorKey: widget.navigatorKey,
            );
            await AppNavigator.navigate<void>(context: context, action: action);
          }
        },
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(bottom: 90),
            decoration: const BoxDecoration(
              color: AppColors.darkBlue,
              gradient: RadialGradient(
                stops: [0.001, 1],
                radius: 0.6,
                colors: [
                  AppColors.primary,
                  AppColors.primary,
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.appLogo.image(width: 175, height: 175),
                  const SizedBox(height: 4),
                  Container(height: 1, width: 32, color: AppColors.white40),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context).catsNetwork,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
