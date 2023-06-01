import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_orelit/screens/homescreen.dart';

import 'controller/newsprovider.dart';
import 'model/bottombarmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavBarModel>(
          create: (_) => BottomNavBarModel(),
        ),
        ChangeNotifierProvider<NewsProvider>(
          create: (_) => NewsProvider(),
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
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
