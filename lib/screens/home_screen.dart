import 'package:flutter/material.dart';
import 'package:movie_app_ui/customWidgets/custom_widgets.dart';
import 'package:movie_app_ui/data/data.dart';

class HomeScreen extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? _scrollOffset = 0;
  ScrollController? _contrl;

  @override
  void initState() {
    _contrl = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _contrl?.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _contrl?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50),
        child: CustomAppBar(
          scrollOffset: _scrollOffset ?? 0,
        ),
      ),
      body: CustomScrollView(
        controller: _contrl,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: Previews(title: 'Previews', contentList: previews),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(title: 'My List', contentList: myList),
          ),
          SliverToBoxAdapter(
            child: ContentList(
                title: 'Netflix Originals',
                contentList: originals,
                isOriginals: true),
          ),
          SliverToBoxAdapter(
            child: ContentList(title: 'Trending', contentList: trending),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: Icon(Icons.cast),
        onPressed: () => print('Cast'),
      ),
    );
  }
}
