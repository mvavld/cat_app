import 'package:cat_app/core/routes/default_page_route_without_animation.dart';
import 'package:cat_app/di/injection.dart';
import 'package:cat_app/entities/breed_entity.dart';
import 'package:cat_app/navigation/navigation_action.dart';
import 'package:cat_app/navigation/navigation_type.dart';
import 'package:cat_app/presentation/breed/bloc/breed_bloc.dart';
import 'package:cat_app/presentation/breed/breed_screen.dart';
import 'package:cat_app/presentation/main/bloc/main_bloc.dart';
import 'package:cat_app/presentation/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator {
  static Future<D?> navigate<D>({
    required BuildContext context,
    required NavigateAction action,
    bool? rootNavigator,
  }) async {
    if (action is NavigateBack) {
      Navigator.pop(context);
      return null;
    }
    late NavigateType navigateType;
    late Route<D> route;
    final routeName = action.runtimeType.toString();
    final _rootNavigator = rootNavigator ?? false;

    action.when(
      navigateBack: () {},
      navigateToMain: (NavigateType type) {
        navigateType = type;
        route = DefaultPageRouteWithoutAnimation(
          settings: RouteSettings(name: routeName),
          builder: (BuildContext context) => BlocProvider(
            create: (context) => MainBloc(
              catRepository: injection(),
              preferencesLocalGateway: injection(),
            ),
            child: const MainScreen(),
          ),
        ) as Route<D>;
      },
      navigateToBreed: (NavigateType type, BreedEntity breed) {
        navigateType = type;
        route = DefaultPageRouteWithoutAnimation(
          settings: RouteSettings(name: routeName),
          builder: (BuildContext context) => BlocProvider(
            create: (context) => BreedBloc(
              breed: breed,
            ),
            child: const BreedScreen(),
          ),
        ) as Route<D>;
      },
    );
    switch (navigateType) {
      case NavigateType.push:
        return Navigator.of(context, rootNavigator: _rootNavigator).push(route);
      case NavigateType.pushReplacement:
        return Navigator.of(context, rootNavigator: _rootNavigator)
            .pushReplacement(route);
      case NavigateType.pushAndRemoveUntil:
        return Navigator.pushAndRemoveUntil<D?>(context, route, (_) => false);
      case NavigateType.popUntil:
        Navigator.popUntil(
          context,
          (routeForCompare) => route == routeForCompare,
        );
    }
    return null;
  }
}
