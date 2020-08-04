import 'package:flutter/material.dart';
import 'package:the_basics/datamodels/episode_item_model.dart';

import 'episode_item.dart';

class EpisodesList extends StatelessWidget {
  final episodes = [
    EpisodeItemModel(
      title: 'Setup, Build and Deploy',
      duration: 14.07,
      imageUrl: _imgUrl(code: 'wjbnIqr'),
    ),
    EpisodeItemModel(
      title: 'Adding a Responsive UI',
      duration: 18.54,
      imageUrl: _imgUrl(code: 'ECEcsm8'),
    ),
    EpisodeItemModel(
      title: 'Layout Templates',
      duration: 14.55,
      imageUrl: _imgUrl(code: 'MfkOfXP'),
    ),
    EpisodeItemModel(
      title: 'State Management and Api integration',
      duration: 14.55,
      imageUrl: _imgUrl(code: '8Ht3kGi'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30,
      runSpacing: 30,
      children: <Widget>[
        ...episodes.map(
          (episode) => EpisodeItem(model: episode),
        )
      ],
    );
  }

  static String _imgUrl({@required String code}) =>
      "https://i.imgur.com/$code.png";
}
