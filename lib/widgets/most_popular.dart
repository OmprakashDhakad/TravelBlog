import 'package:flutter/material.dart';
import 'package:app/model/travel.dart';

class MostPopular extends StatelessWidget {
  final _list = Travel.generateMostPopular();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var travel = _list[index];
        return Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  travel.url,
                  width: 140,
                  fit: BoxFit.cover,
                ))
          ],
        );
      },
      separatorBuilder: (_, index) => SizedBox(width: 15),
      itemCount: _list.length,
    );
  }
}
