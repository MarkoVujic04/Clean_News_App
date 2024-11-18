import 'package:cleanapp/core/resources/data_state.dart';
import 'package:cleanapp/core/use_cases/usecase.dart';
import 'package:cleanapp/domain/entities/article.dart';
import 'package:cleanapp/domain/repositories/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>,void> {

  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticle();
  }
  
}