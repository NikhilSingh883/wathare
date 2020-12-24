import 'package:flutter/material.dart';
import 'package:wathare/models/recent.dart';
import 'package:wathare/size_config.dart';

class RecentTile extends StatefulWidget {
  final Recent _recent;
  RecentTile(this._recent);
  @override
  _RecentState createState() => _RecentState();
}

class _RecentState extends State<RecentTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 1.5,
          vertical: SizeConfig.heightMultiplier),
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 2.5,
          vertical: SizeConfig.heightMultiplier * 1.5),
      width: SizeConfig.widthMultiplier * 46,
      height: SizeConfig.heightMultiplier * 15,
      decoration: BoxDecoration(
          color: widget._recent.color,
          borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "${widget._recent.standard}" + '\u1d57' + '\u02b0',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          FittedBox(
            child: Text(
              "${widget._recent.subject}" + ' Assignment',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          FittedBox(
            child: Text(
              'June 01 2020',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        ],
      ),
    );
  }
}
