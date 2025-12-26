import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wall/features/auth/domain/auth.dart';
import 'package:wall/features/auth/presentation/services/login_or_register.dart';
import 'package:wall/features/dashboard/presentation/pages/home_page.dart';
import 'package:wall/features/profile/presentation/pages/profile_page.dart';
import 'package:wall/features/theme/provider/theme_provider.dart';
import 'package:wall/features/users/presentation/pages/users_page.dart';
import 'package:wall/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/': (context) => const  AuthPage(),
        'login_register_page': (context) => const LoginOrRegister(),
        'home_page': (context) => HomePage(),
        'profile_page': (context) => ProfilePage(),
        'users_page': (context) => const UsersPage()
      },
    );
  }
}
