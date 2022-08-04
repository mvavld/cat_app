import 'package:flutter/material.dart';

class DefaultPageRouteWithoutAnimation extends MaterialPageRoute<dynamic> {
  DefaultPageRouteWithoutAnimation({
    required super.builder,
    super.settings,
  });

  @override
  Duration get transitionDuration => Duration.zero;
}
