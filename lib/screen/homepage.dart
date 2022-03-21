import 'package:flutter/material.dart';
import 'package:news_testing/model/article.dart';
import 'package:news_testing/screen/newspage.dart';
import 'package:news_testing/service/service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    News news = News();
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
            width: 10,
            margin: const EdgeInsets.all(5),
          ),
          title: const Text(
            'Good Morning',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark,
                  color: Colors.blue,
                ))
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: FutureBuilder(
            future: news.getNews(),
            builder: (context, snapshot) => snapshot.data != null
                ? NewsPage(article: snapshot.data as List<Article>)
                : const Center(child: CircularProgressIndicator())));
  }
}
