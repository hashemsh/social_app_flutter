import 'package:flutter/material.dart';
import 'package:social_app_flutter/data/data.dart';
import 'package:social_app_flutter/widgets/custom_navigationbar.dart';
import 'package:social_app_flutter/widgets/following_users.dart';
import 'package:social_app_flutter/widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController1;
  late PageController _pageController2;
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
        title: Text(
          'FRENZY',
          style: TextStyle(
              color: themeData.primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 10.0),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.sms),
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 2.0,
          indicatorColor: Colors.lightBlueAccent,
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
          FollowingUsers(),
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
