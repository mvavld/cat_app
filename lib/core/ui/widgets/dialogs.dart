import 'dart:io';

import 'package:cat_app/core/bloc/bloc_action.dart';
import 'package:cat_app/core/enums/message_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static Future<void> showMessageDialog({
    required BuildContext context,
    String? title,
    required String message,
    required String buttonText,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            title: title != null ? Text(title) : null,
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: Text(
                  buttonText,
                  style: const TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        } else {
          return AlertDialog(
            title: title != null ? Text(title) : null,
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: Text(
                  buttonText,
                  style: const TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
      },
    );
  }
}

void showMessage(BuildContext context, ShowMessage action) {
  switch (action.messageType) {
    case MessageType.customMessage:
      Dialogs.showMessageDialog(
        context: context,
        title: action.title,
        message: action.message!,
        buttonText: 'ok',
      );
      break;
    case MessageType.noConnection:
      Dialogs.showMessageDialog(
        context: context,
        title: 'Can not get data',
        message: 'Please check your connection',
        buttonText: 'ok',
      );
      break;
    case MessageType.undefinedError:
      Dialogs.showMessageDialog(
        context: context,
        title: 'error',
        message: 'Something went wrong',
        buttonText: 'ok',
      );
      break;
  }
}
