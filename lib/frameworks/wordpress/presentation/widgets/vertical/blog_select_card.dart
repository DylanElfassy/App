import 'package:flutter/material.dart';

import '../../../../../common/tools.dart';
import '../../../../../screens/index.dart';
import '../../../../../widgets/blog/blog_action_button_mixin.dart';

class BlogSelectCard extends StatelessWidget with BlogActionButtonMixin {
  final Blog item;
  final List<Blog> listBlog;
  final width;
  final marginRight;
  final kSize size;
  final bool isHero;
  final bool showHeart;

  const BlogSelectCard({
    required this.item,
    required this.listBlog,
    this.width,
    this.size = kSize.medium,
    this.isHero = false,
    this.showHeart = false,
    this.marginRight = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    void onTapProduct() {
      if (item.imageFeature == '') return;

      onTapBlog(
        blog: item,
        blogs: listBlog,
        context: context,
      );
    }

    return GestureDetector(
      onTap: onTapProduct,
      child: Container(
        color: Theme.of(context).cardColor,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ImageResize(
                url: item.imageFeature,
                width: width,
                size: kSize.medium,
              ),
            ),
            Container(
              width: width,
              alignment: Alignment.topLeft,
              padding:
                  const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: width,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(
                        top: 10, left: 8, right: 8, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10.0),
                        Text(
                          item.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          item.date,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withValueOpacity(0.5),
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
