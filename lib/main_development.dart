import 'package:cat_app/bootstrap.dart';
import 'package:cat_app/di/injection.dart';
import 'package:cat_app/presentation/app/app.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await setUpLocator();
  await bootstrap(App.new);
}
