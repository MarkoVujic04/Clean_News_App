import 'package:cleanapp/core/resources/data_state.dart';
import 'package:cleanapp/domain/use_cases/get_article.dart';
import 'package:cleanapp/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:cleanapp/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState>{

  final GetArticleUseCase _getArticleUseCase;
  RemoteArticlesBloc(this. _getArticleUseCase) : super(const RemoteArticlesLoading()) {
    on <GetArticles> (onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();
    
    if(dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    if(dataState is DataFailed) {
      emit(
        RemoteArticlesError(dataState.error!)
      );
    }
  }
}