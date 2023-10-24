import 'package:helzy/providers/articles_provider.dart';
import 'package:helzy/models/article.dart';
import 'package:helzy/providers/helzy_star_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../content/widgets/content_item.dart';
import '../../main_widgets/my_app_bar.dart';

class ArticlesScreen extends StatefulWidget {
  static const routeName = '/articles';
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ArticlesProvider>(context, listen: false).fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Article> articles = Provider.of<ArticlesProvider>(context).articles;
    final int starsCount = Provider.of<HelzyStarsProvider>(context).starsCount;

    return Scaffold(
      appBar: MyAppBar(
        theme: theme,
        title: 'Articles',
        text: '$starsCount',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                // SearchInput
                controller: TextEditingController(),
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (val) {},
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (BuildContext context, index) {
                    return ContentBuyItem(index: index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
