import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_basics/styles/text_styles.dart';
import 'package:the_basics/viewmodels/episode_details_view_model.dart';
import 'package:the_basics/widgets/list_view_column/list_view_column.dart';

class EpisodeDetails extends StatelessWidget {
  final int id;
  const EpisodeDetails({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return ViewModelProvider<EpisodeDetailsViewModel>.withConsumer(
        viewModelBuilder: () => EpisodeDetailsViewModel(),
        onModelReady: (model) => model.getEpisodeData(id),
        builder: (context, model, child) => ListViewColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
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
                    style: descriptionTextStyle(
                      sizingInformation.deviceScreenType,
                    ),
                    textAlign: TextAlign.center,
                  ),
          ],
        ),
      );
    });
  }
}
