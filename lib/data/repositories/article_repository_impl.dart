import 'dart:io';

import 'package:cleanapp/core/constants/constants.dart';
import 'package:cleanapp/core/resources/data_state.dart';
import 'package:cleanapp/data/data_sources/remote/news_api_service.dart';
import 'package:cleanapp/data/models/article.dart';
import 'package:cleanapp/domain/repositories/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticle(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
