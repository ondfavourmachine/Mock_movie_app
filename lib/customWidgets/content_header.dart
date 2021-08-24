import 'package:flutter/material.dart';
import 'package:movie_app_ui/customWidgets/custom_widgets.dart';
import 'package:movie_app_ui/models/content_model.dart';

class ContentHeader extends StatelessWidget {
  final Content? featuredContent;

  ContentHeader({this.featuredContent});

  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: 500,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(featuredContent!.imageUrl),
                fit: BoxFit.cover)),
      ),
      Container(
        height: 500,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
      ),
      Positioned(
        bottom: 110,
        child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent!.titleImageUrl as String)),
      ),
      Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: 'List',
                onTap: () => print('My List'),
              ),
              _PlayButton(),
              VerticalIconButton(
                icon: Icons.info_outline,
                title: 'Info',
                onTap: () => print('My Info'),
              ),
            ],
          ))
    ]);
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => print(
        'Play',
      ),
      icon: Icon(
        Icons.play_arrow,
        size: 30,
        color: Colors.black,
      ),
      style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.fromLTRB(15, 5, 20, 5)),
      label: const Text('Play',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
    );
  }
}
