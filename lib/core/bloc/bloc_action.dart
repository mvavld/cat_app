import 'package:cat_app/core/enums/message_type.dart';

abstract class BlocAction {}

class ShowLoader extends BlocAction {}

class HideLoader extends BlocAction {}

class ShowMessage extends BlocAction {
  ShowMessage({required this.messageType, this.title, this.message});
  MessageType messageType;
  String? title;
  String? message;
}
