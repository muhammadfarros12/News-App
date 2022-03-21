import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:news_testing/model/article.dart';
import 'package:news_testing/service/service.dart';
import 'package:news_testing/widget/newsitem.dart';

class TabBarMenu extends StatefulWidget {
  final List<Article> article;

  const TabBarMenu({Key? key, required this.article}) : super(key: key);

  @override
  _TabBarMenuState createState() => _TabBarMenuState();
}

class _TabBarMenuState extends State<TabBarMenu>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> myTab = <Tab>[
    const Tab(
      text: 'Business',
    ),
    const Tab(
      text: 'Entertainment',
    ),
    const Tab(
      text: 'General',
    ),
    const Tab(
      text: 'Health',
    ),
    const Tab(
      text: 'Science',
    ),
    const Tab(
      text: 'Sports',
    ),
    const Tab(
      text: 'Technology',
    )
  ];

  @override
  void initState() {
    _tabController = TabController(length: myTab.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var news = News();
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: myTab,
            labelColor: Colors.deepOrangeAccent,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const BubbleTabIndicator(
                indicatorHeight: 30,
                indicatorColor: Colors.black,
                tabBarIndicatorSize: TabBarIndicatorSize.tab),
            isScrollable: true,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: myTab.map((Tab tab) {
                    return FutureBuilder(
                        future: news.getNewsByCategory(tab.text.toString()),
                        builder: (context, snapshot) => snapshot.data != null
                            ? _listNewsCategory(snapshot.data as List<Article>)
                            : const Center(child: CircularProgressIndicator()));
                  }).toList()))
        ],
      ),
    );
  }

  Widget _listNewsCategory(List<Article> article) {
    return Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView.builder(
            itemBuilder: (context, index) => NewsItem(article: article[index]),
            itemCount: article.length));
  }
}
