import 'package:flutter/material.dart';
import 'package:movie_app_ui/models/content_model.dart';

class ContentList extends StatelessWidget {
  const ContentList(
      {Key? key,
      required this.title,
      required this.contentList,
      this.isOriginals = false})
      : super(key: key);
  final String title;
  final List<Content> contentList;
  final bool? isOriginals;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: isOriginals as bool ? 500 : 220,
            child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: contentList.length,
                itemBuilder: (BuildContext context, int index) {
                  final Content content = contentList[index];
                  return GestureDetector(
                      onTap: () => print(content.name),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        height: isOriginals as bool ? 400 : 200,
                        width: isOriginals as bool ? 200 : 130,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(content.imageUrl),
                                fit: BoxFit.cover)),
                      ));
                }),
          )
        ],
      ),
    );
  }
}
