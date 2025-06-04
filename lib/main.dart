import 'package:cototinder/core/app_widget.dart';
import 'package:flutter/material.dart';

import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const AppWidget());
}
