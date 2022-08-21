import 'package:flutter/material.dart';
import 'package:tmdbflutter/styles/styles.dart';
import 'package:tmdbflutter/widgets/search/search_widget.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: BouncingScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: Color(0xff0E0E0E),
            pinned: true,
            // bottom: PreferredSize(
            //   child: SearchField(),
            //   preferredSize: Size.fromHeight(20),
            // ),
            expandedHeight: MediaQuery.of(context).size.height * .2,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              title: Align(
                alignment: Alignment.bottomLeft,
                child: buildTitle(),
              ),
              background: Container(
                color: Color(0xff0E0E0E),
                // child: MoviesSliverCarousel(),
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: SearchHeaderDelegate(58),
            pinned: true,
          )
        ];
      },
      body: SearchWidget(),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'SEARCH',
            style: Styles.mBold.copyWith(
              color: Colors.pinkAccent,
              fontSize: 10,
            ),
          ),
          Text(
            'Find everything',
            style: Styles.mBold.copyWith(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;

  SearchHeaderDelegate(this.height);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SearchField();
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
