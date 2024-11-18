import 'package:cleanapp/data/data_sources/remote/news_api_service.dart';
import 'package:cleanapp/data/repositories/article_repository_impl.dart';
import 'package:cleanapp/domain/repositories/article_repository.dart';
import 'package:cleanapp/domain/use_cases/get_article.dart';
import 'package:cleanapp/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl())
  );

  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl())
  );

  sl.registerFactory<RemoteArticlesBloc>(
    () => RemoteArticlesBloc(sl())
  );
}