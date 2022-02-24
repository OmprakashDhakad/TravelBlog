import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/travel.dart';

class DetailPage extends StatelessWidget {
  final Travel travel;
  final double expandedHeight = 300;
  final double roundedContainerHeight;
  DetailPage({required this.travel, this.roundedContainerHeight});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      CustomScrollView(
        slivers: [
          _buildSilverHead()
        ],
      )
    ]));
  }

  Widget _buildSilverHead() {
    return SliverPersistentHeader(delegate: DetaileSliverDelegate(travel: travel, expandedHeight: expandedHeight, roundedContainerHeight: roundedContainerHeight));
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
        )
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
