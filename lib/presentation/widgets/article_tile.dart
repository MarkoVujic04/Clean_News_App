import 'package:cached_network_image/cached_network_image.dart';
import 'package:cleanapp/domain/entities/article.dart';
import 'package:flutter/material.dart';

class ArticleTile extends StatelessWidget {

  final ArticleEntity ? article;

  const ArticleTile({super.key, this.article});

  @override
Widget build(BuildContext context) {
  print('Article Data: ${article?.title}, ${article?.description}, ${article?.urlToImage}');
  double screenHeight = MediaQuery.of(context).size.height;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: screenHeight * 0.2,
      child: Row(
        children: [
          _buildImage(context),
          _buildText(context),
        ],
      ),
    ),
  );
}


    Widget _buildImage(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return CachedNetworkImage(
      imageUrl: article?.urlToImage ?? '',
      imageBuilder: (context, imageProvider) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: screenWidth * 0.3,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
        ),
      ),
      errorWidget: (context, url, error) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: screenWidth * 0.3,
            height: double.maxFinite,
            color: Colors.grey,
            child: Icon(
              Icons.error,
              color: Colors.red,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return Expanded(
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01, 
        horizontal: screenWidth * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            article?.title ?? 'No Title Available',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: screenHeight * 0.02, 
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.01), 
          Text(
            article?.description ?? 'No Description Available',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: screenHeight * 0.018, 
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}

}