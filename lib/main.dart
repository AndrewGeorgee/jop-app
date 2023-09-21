import 'package:flutter/material.dart';
import 'package:job_application/core/theme/theme.dart';
import 'package:job_application/screen/forget_password/view/forget_password_view.dart';

import 'core/utils/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModules();
  initForgetPasswordModule();
  runApp(const MyApp());
  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context) => const MyApp(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      theme: AppTheme.lightTheme(context),

      home: const ForgetPasswordView(),
    );
  }
}
