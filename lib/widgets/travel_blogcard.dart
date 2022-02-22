import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/model/travel.dart';

class TravelBlogCard extends StatelessWidget {
  final _list = Travel.generateTravelBlog();
  final _pageCtrl = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageCtrl,
      itemCount: _list.length,
      itemBuilder: (context, index) {
        var travel = _list[index];
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  travel.url,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              left: 15,
              child: Column(children: [
                Material(
                    color: Colors.transparent,
                    child: Text(
                      travel.location,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
                Material(
                    color: Colors.transparent,
                    child: Text(
                      travel.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    )),
              ]),
            )
          ],
        );
      },
    );
  }
}
