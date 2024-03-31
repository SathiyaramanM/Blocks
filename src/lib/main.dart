import 'package:blocks/app/app.dialogs.dart';
import 'package:blocks/ui/common/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:blocks/app/app.locator.dart';
import 'package:blocks/app/app.router.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  loadObjectBoxLibraryAndroidCompat();
  await setupLocator();
  setupDialogUi();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
