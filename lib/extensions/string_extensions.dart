import 'package:the_basics/datamodels/routing_data.dart';

extension StringExtension on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);

    return RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );
  }
}
