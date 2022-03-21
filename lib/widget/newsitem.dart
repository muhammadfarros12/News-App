import 'package:flutter/material.dart';
import 'package:news_testing/utility/utils.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../model/article.dart';

class NewsItem extends StatelessWidget {
  final Article article;

  const NewsItem({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // to detail
      },
      child: Card(
        elevation: 5,
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.network(
                          article.urlToImage,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(article.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: titleArticle.copyWith(fontSize: 12)),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 12,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        time(DateTime.parse(
                                            article.publishedAt)),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: authorDateArticle.copyWith(
                                            fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                // Spacer(),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      size: 12,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        article.author,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: authorDateArticle.copyWith(
                                            fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  String time(DateTime parse) {
    return timeago.format(parse, allowFromNow: true, locale: 'en');
  }
}
