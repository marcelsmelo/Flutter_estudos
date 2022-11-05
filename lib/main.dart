import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:login_provider_example/screens/home_screen.dart';
import 'package:login_provider_example/controllers/login_controller.dart';
import 'package:login_provider_example/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginController>(
            create: (_) => LoginController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print

    print('ready in 3...');
    await Future.delayed(const Duration(microseconds: 500));
    print('ready in 2...');
    await Future.delayed(const Duration(microseconds: 500));
    print('ready in 1...');
    await Future.delayed(const Duration(microseconds: 500));
    print('go!');
    FlutterNativeSplash.remove();
    //Provider.of<LoginController>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(
        builder: (context, controller, child) => MaterialApp(
              title: 'Login Provider',
              theme: ThemeData(
                primarySwatch: Colors.purple,
              ),
              home: controller.logged ? HomeScreen() : LoginScreen(),
            ));
  }
}
