import 'package:flutter/material.dart';
import 'package:social_app_flutter/data/data.dart';
import 'package:social_app_flutter/widgets/following_users.dart';
import 'package:social_app_flutter/widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController1;
  PageController _pageController2;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController1 = PageController(initialPage: 0, viewportFraction: 0.8);
    _pageController2 = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: themeData.primaryColor),
        centerTitle: true,
        title: Text(
          'FRENZY',
          style: TextStyle(
              color: themeData.primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 10.0),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 2.0,
          labelColor: themeData.primaryColor,
          labelStyle: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          tabs: const [
            Tab(
              text: 'Trending',
            ),
            Tab(
              text: 'Latest',
            ),
          ],
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const FollowingUsers(),
          PostsCarousel(
            pageController: _pageController1,
            title: 'Posts',
            posts: posts,
          ),
          PostsCarousel(
            pageController: _pageController2,
            title: 'People follow',
            posts: posts.reversed.toList(),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
