import 'package:social_app_flutter/models/post_model.dart';

class User {
  final String profileImageUrl;
  final String backgroundImageUrl;
  final String name;
  final int following;
  final int followers;
  final List<Post> posts;
  final List<Post> favorites;

  User({
    required this.profileImageUrl,
    required this.backgroundImageUrl,
    required this.name,
    required this.following,
    required this.followers,
    required this.posts,
    required this.favorites,
  });
}
