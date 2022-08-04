part of 'main_bloc.dart';

abstract class MainEvent {}

class Init extends MainEvent {}

class PageScrolled extends MainEvent {
  PageScrolled(
    this.itemsScrolled,
  );

  final int itemsScrolled;
}
