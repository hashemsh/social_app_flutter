import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:social_app_flutter/models/post_model.dart';

class ExploreScreen extends StatelessWidget {
  final List<Post> posts;
  const ExploreScreen({Key? key, required this.posts}) : super(key: key);

  //for load image From Post Data
  _masonryLayout(BuildContext context, int index) {
    Post post = posts[index];
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                color: Colors.black45, offset: Offset(0, 2), blurRadius: 6.0)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image(image: AssetImage(post.imageUrl)),
        ),
      ),
    );
  }

  //just For test from network by Count 20 and 30 or etc
  _networkImage(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38, offset: Offset(0, 2), blurRadius: 6.0)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network('https://source.unsplash.com/random?sig=$index'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: MasonryGridView.builder(
          physics: const BouncingScrollPhysics(),
          // itemCount: posts.length,
          itemCount: 20,
          padding: const EdgeInsets.all(10),
          itemBuilder: ((context, index) {
            return _networkImage(context, index);
          }),
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
        ),
      ),
    );
  }
}
