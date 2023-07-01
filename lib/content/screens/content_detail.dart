import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../providers/content.dart' show Content, ContentList;
import '../../widgets/my_app_bar.dart' show ChildAppBar;

class ContentDetailScreen extends StatelessWidget {
  final int index;

  const ContentDetailScreen({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    Content content =
        Provider.of<ContentList>(context).contentList.elementAt(index);

    return Scaffold(
      appBar: ChildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
          child: Column(
            children: [
              Text(
                content.title,
                style: theme.headlineSmall,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Image.asset(content.imageUrl),
              ),
              Text(content.text),
            ],
          ),
        ),
      ),
    );
  }
}
