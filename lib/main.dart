import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'features/data/datasources/auth_remote.dart';
import 'features/data/repositories/auth_repo.dart';
import 'features/presentation/pages/authpage/login.dart';
import 'features/presentation/viewmodels/auth_viewmodel.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        // 1. Data source
        Provider(
          create: (_) => AuthRemoteDataSource(),
        ),

        // 2. Repository (depends on datasource)
        ProxyProvider<AuthRemoteDataSource, AuthRepository>(
          update: (_, remote, __) => AuthRepository(remote),
        ),

        // 3. ViewModel (depends on repository)
        ChangeNotifierProxyProvider<AuthRepository, LoginViewModel>(
          create: (context) => LoginViewModel(
            Provider.of<AuthRepository>(context, listen: false),
          ),
          update: (_, repo, vm) => LoginViewModel(repo),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      // Light Theme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        brightness: Brightness.light,
      ),

      debugShowCheckedModeBanner: false,

      // Dark Theme
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        brightness: Brightness.dark,
      ),

      // Auto theme
      themeMode: ThemeMode.system,

      home: const LoginUI(),
    );
  }
}