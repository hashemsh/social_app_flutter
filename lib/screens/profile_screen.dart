import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:social_app_flutter/models/user_model.dart';
import 'package:social_app_flutter/widgets/custom_navigationbar.dart';
import 'package:social_app_flutter/widgets/posts_carousel.dart';
import 'package:social_app_flutter/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  late PageController _yourPostPageController;
  late PageController _favoritesPageController;

  @override
  void initState() {
    super.initState();
    _yourPostPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
    _favoritesPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 200.0,
                    width: double.infinity,
                    image: AssetImage(widget.user.backgroundImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 2),
                            blurRadius: 6.0)
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 120.0,
                        width: 120.0,
                        image: AssetImage(widget.user.profileImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.user.name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(color: Colors.black54, fontSize: 22.0),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      widget.user.following.toString(),
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(color: Colors.black54, fontSize: 22.0),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      widget.user.followers.toString(),
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
            PostsCarousel(
              pageController: _yourPostPageController,
              title: 'Your Posts',
              posts: widget.user.posts,
            ),
            PostsCarousel(
              pageController: _favoritesPageController,
              title: 'Favorites',
              posts: widget.user.favorites,
            ),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
