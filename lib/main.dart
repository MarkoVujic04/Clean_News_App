import 'package:cleanapp/injection_container.dart';
import 'package:cleanapp/presentation/screens/home/daily_news.dart';
import 'package:cleanapp/presentation/theme/app_themes.dart';
import 'package:flutter/material.dart';

void main() async{
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(context),
      home: const DailyNews()
    );
  }
}
