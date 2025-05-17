import 'package:mundi_flutter_platform_client_app/app/models/entrepreneur.dart';

double calculeStars(List<Rating> ratings) {
  var stars = 0.0;
  for (var i = 0; i < (ratings.length); i++) {
    stars = stars + ratings[i].rating;
  }
  stars = stars / (ratings.length);

  return stars;
}
