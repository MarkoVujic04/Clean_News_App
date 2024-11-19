import 'package:cleanapp/injection_container.dart';
import 'package:cleanapp/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:cleanapp/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:cleanapp/presentation/screens/home/daily_news.dart';
import 'package:cleanapp/presentation/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(context),
        home: const DailyNews()
      ),
    );
  }
}
