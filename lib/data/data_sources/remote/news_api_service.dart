import 'package:retrofit/retrofit.dart';
import 'package:cleanapp/core/constants/constants.dart';
import 'package:cleanapp/data/models/article.dart';
import 'package:dio/dio.dart';
part "news_api_service.g.dart";

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET("/top-headlines")
  Future<HttpResponse<List<ArticleModel>>> getNewsArticle( {
    @Query("apiKey") String ? apiKey,
    @Query("country") String ? country,
    @Query("category") String ? category,
  });
}

