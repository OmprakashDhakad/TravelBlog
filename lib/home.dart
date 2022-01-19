import 'package:flutter/material.dart';

import 'widgets/travel_blogcard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("Travel Blog", style: TextStyle(fontSize: 30.0)),
          ),
          Expanded(
            flex: 2,
            child: TravelBlogCard(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Most Popular", style: TextStyle(fontSize: 20.0)),
                Text("View More", style: TextStyle(fontSize: 16.0, color: Colors.deepOrange)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
