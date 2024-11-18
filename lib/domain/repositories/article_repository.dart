import 'package:cleanapp/core/resources/data_state.dart';
import 'package:cleanapp/domain/entities/article.dart';

abstract class ArticleRepository {

  Future<DataState<List<ArticleEntity>>> getNewsArticle();
}