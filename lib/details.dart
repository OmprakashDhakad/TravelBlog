import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/travel.dart';

class DetailPage extends StatelessWidget {
  final Travel travel;
  final double expandedHeight = 300;
  final double roundedContainerHeight = 50;
  DetailPage({required this.travel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      CustomScrollView(
        slivers: [
          _buildSilverHead(),
          SliverToBoxAdapter(
            child: _buildDetail(),
          )
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 25, left: 15, right: 15),
        child: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ],
            )),
      )
    ]));
  }

  Widget _buildSilverHead() {
    return SliverPersistentHeader(delegate: DetaileSliverDelegate(travel: travel, expandedHeight: expandedHeight, roundedContainerHeight: roundedContainerHeight));
  }

  Widget _buildDetail() {
    return Container(
        color: Colors.white,
        child: Column(children: [
          _buildUserInfo(),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text('In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is', style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.5)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Featured', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1.5)),
              Text('View all', style: TextStyle(color: Colors.deepOrange, fontSize: 16)),
            ]),
          ),
          SizedBox(
            height: 120,
            child: FeaturedWidget(),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text('In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is', style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.5)),
          ),
        ]));
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(travel.url, width: 50, height: 50, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(travel.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(travel.location, style: TextStyle(fontSize: 16)),
          ]),
        ),
        Spacer(),
        Icon(Icons.share, color: Colors.grey)
      ]),
    );
  }
}

class FeaturedWidget extends StatelessWidget {
  final _list = Travel.generateMostPopular();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 15, top: 10),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var travel = _list[index];
        return Container(width: 120, child: Image.asset(travel.url, fit: BoxFit.cover));
      },
      separatorBuilder: (_, index) => SizedBox(width: 10),
      itemCount: _list.length,
    );
  }
}

class DetaileSliverDelegate extends SliverPersistentHeaderDelegate {
  final Travel travel;
  final double expandedHeight;
  final double roundedContainerHeight;
  DetaileSliverDelegate({required this.travel, required this.expandedHeight, required this.roundedContainerHeight});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Opacity(opacity: 0.8, child: Image.asset(travel.url, width: MediaQuery.of(context).size.width, height: expandedHeight, fit: BoxFit.cover)),
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          ),
        ),
        Positioned(
            top: expandedHeight - shrinkOffset - 120,
            left: 30,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(travel.name, style: TextStyle(color: Colors.white, fontSize: 30)),
              Text(travel.location, style: TextStyle(color: Colors.white, fontSize: 20))
            ]))
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
