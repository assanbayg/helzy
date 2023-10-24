import 'package:helzy/models/article.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../providers/articles_provider.dart' show ArticlesProvider;
import '../../../main_widgets/my_app_bar.dart' show ChildAppBar;

class ContentDetailScreen extends StatelessWidget {
  final int index;

  const ContentDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    Article article = Provider.of<ArticlesProvider>(context).articles[index];

    return Scaffold(
      appBar: ChildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
          child: Column(
            children: [
              Text(
                article.title,
                style: theme.headlineSmall,
              ),
              if (article.imageUrl.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Image.asset(article.imageUrl),
                ),
              Text(article.text),
            ],
          ),
        ),
      ),
    );
  }
}
