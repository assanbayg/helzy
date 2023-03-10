import 'package:helzy/providers/helzy_star.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../providers/content.dart';
import '../content/widgets/content_item.dart';
import '../widgets/my_app_bar.dart';

class ContentScreen extends StatefulWidget {
  static const routeName = '/content';
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Content> contentList = Provider.of<ContentList>(context).contentList;
    int starsCount = Provider.of<HelzyStars>(context).starsCount;
    return Scaffold(
      appBar: MyAppBar(
        theme: theme,
        title: 'Content',
        text: '$starsCount',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              //SearchInput
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
                  itemCount: contentList.length,
                  itemBuilder: (BuildContext context, index) {
                    return ContentBuyItem(index: index);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
