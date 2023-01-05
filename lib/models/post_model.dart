import 'package:social_app_flutter/models/user_model.dart';

class Post {
  final String imageUrl;
  final User author;
  final String title;
  final String location;
  final int likes;
  final int comments;

  Post({
    required this.imageUrl,
    required this.author,
    required this.title,
    required this.location,
    required this.likes,
    required this.comments,
  });
}
