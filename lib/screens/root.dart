import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:social_app_flutter/data/data.dart';
import 'package:social_app_flutter/screens/explore_screen.dart';
import 'package:social_app_flutter/screens/home_screen.dart';
import 'package:social_app_flutter/screens/profile_screen.dart';

const int homeIndex = 0;
const int likeIndex = 1;
const int exploreIndex = 2;
const int profileIndex = 3;
int selectedScreenIndex = homeIndex;

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final List<int> _history = [];
  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _likeKey = GlobalKey();
  final GlobalKey<NavigatorState> _exploreKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    likeIndex: _likeKey,
    exploreIndex: _exploreKey,
    profileIndex: _profileKey
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: IndexedStack(
            index: selectedScreenIndex,
            children: [
              _navigator(_homeKey, homeIndex, const HomeScreen()),
              _navigator(_likeKey, likeIndex,
                  const Scaffold(backgroundColor: Colors.red)),
              _navigator(
                  _exploreKey, exploreIndex, ExploreScreen(posts: posts)),
              _navigator(
                  _profileKey, profileIndex, ProfileScreen(user: currentUser))
            ],
          ),
          bottomNavigationBar: GNav(
            backgroundColor: themeData.primaryColor,
            color: Colors.white38,
            activeColor: Colors.white,
            gap: 8,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Likes',
              ),
              GButton(
                icon: Icons.search,
                text: 'Explore',
              ),
              GButton(
                icon: Icons.account_circle,
                text: 'Profile',
              ),
            ],
            selectedIndex: selectedScreenIndex,
            onTabChange: (index) {
              setState(() {
                _history.remove(selectedScreenIndex);
                _history.add(selectedScreenIndex);
                selectedScreenIndex = index;
              });
            },
          ),
        ));
  }
}

Widget _navigator(GlobalKey key, int index, Widget child) {
  return key.currentState == null && selectedScreenIndex != index
      ? Container()
      : Navigator(
          key: key,
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) =>
                Offstage(offstage: selectedScreenIndex != index, child: child),
          ),
        );
}
