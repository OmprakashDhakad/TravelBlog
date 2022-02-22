import 'package:flutter/material.dart';
import 'package:app/model/travel.dart';

class MostPopular extends StatelessWidget {
  final _list = Travel.generateMostPopular();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        var travel = _list[index];
        return Stack();
      },
      separatorBuilder: (_, index) => SizedBox(width: 15),
      itemCount: _list.length,
    );
  }
}
