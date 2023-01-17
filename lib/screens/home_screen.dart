import 'package:flutter/material.dart';
import 'package:social_app_flutter/data/data.dart';
import 'package:social_app_flutter/models/post_model.dart';
import 'package:social_app_flutter/widgets/following_users.dart';
import 'package:social_app_flutter/widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController1;
  late PageController _pageController2;
  final _tabController = PageController();
  @override
  void initState() {
    super.initState();
    _pageController1 = PageController(initialPage: 0, viewportFraction: 0.8);
    _pageController2 = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: themeData.primaryColor),
          title: Text(
            'MY SOCIAL',
            style: TextStyle(
                color: themeData.primaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 6.0),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.sms),
              ),
            ),
          ],
          bottom: TabBar(
            indicatorWeight: 2.0,
            indicatorColor: themeData.primaryColor,
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
        body: TabBarView(
          children: [
            _trendingWidget(),
            _latestWidget(),
          ],
        ),
      ),
    );
  }

  PageView _latestWidget() {
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      controller: _tabController,
      scrollDirection: Axis.vertical,
      // itemCount: posts.length,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        // Post post = posts[index];
        return Image(
          image: NetworkImage('https://source.unsplash.com/random?sig=$index'),
          // AssetImage(post.imageUrl)
          fit: BoxFit.cover,
        );
      },
    );
  }

  ListView _trendingWidget() {
    return ListView(
      physics: const BouncingScrollPhysics(),
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
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
