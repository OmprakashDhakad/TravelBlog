import 'package:flutter/material.dart';
import 'model/travel.dart';

class DetailPage extends StatelessWidget {
  final Travel travel;
  DetailPage({@required this.travel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Text("DetailPage")));
  }
}
