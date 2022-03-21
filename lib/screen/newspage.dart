import 'package:flutter/material.dart';
import 'package:news_testing/model/article.dart';
import 'package:news_testing/utility/utils.dart';
import 'package:news_testing/widget/carousel_widget.dart';
import 'package:news_testing/widget/tabbar_menu.dart';

class NewsPage extends StatefulWidget {
  final List<Article> article;

  NewsPage({Key? key, required this.article}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text('Breaking News', style: titleHome),
          ),
          CarouselWidget(
            articleList: widget.article,
          ),
          TabBarMenu(
            article: widget.article,
          )
        ],
      ),
    );
  }
}
