import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:the_basics/viewmodels/episode_details_view_model.dart';

class EpisodeDetails extends StatelessWidget {
  final int id;
  const EpisodeDetails({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EpisodeDetailsViewModel>.withConsumer(
      viewModelBuilder: () => EpisodeDetailsViewModel(),
      onModelReady: (model) => model.getEpisodeData(id),
      builder: (context, model, child) => Center(
        child: Column(
          children: <Widget>[
            model.episode == null
                ? Container()
                : SizedBox(
                    height: 320,
                    child: FadeInImage.assetNetwork(
                      placeholder:
                          'assets/img-placeholder.png', // Before image load
                      image: model.episode.imageUrl, // After image load
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
            model.episode == null
                ? Center(child: CircularProgressIndicator())
                : Text(
                    model.episode.title,
                    style: TextStyle(fontSize: 60),
                  ),
          ],
        ),
      ),
    );
  }
}
