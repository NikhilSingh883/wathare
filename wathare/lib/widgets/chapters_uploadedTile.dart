import 'package:flutter/material.dart';
import 'package:wathare/models/chapter.dart';
import 'package:wathare/screens/random.dart';
import 'package:wathare/size_config.dart';

class ChapterUploadedTile extends StatefulWidget {
  final Chapter _chapter;

  ChapterUploadedTile(this._chapter);
  @override
  _ChapterUploadedState createState() => _ChapterUploadedState();
}

class _ChapterUploadedState extends State<ChapterUploadedTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Random()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier / 2),
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 1.5,
            vertical: SizeConfig.heightMultiplier * 1.5),
        height: SizeConfig.heightMultiplier * 8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier),
            border: Border.all(color: Colors.grey[200])),
        child: Row(
          children: [
            Container(
              height: SizeConfig.heightMultiplier * 4,
              margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 2),
              child: Image(
                image: AssetImage(
                  'assets/page.png',
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: FittedBox(
                    child: Text(
                      'Class ' +
                          "${widget._chapter.standard}" +
                          " | " +
                          "Chapter " +
                          "${widget._chapter.chapter}" +
                          "- " +
                          "${widget._chapter.topic}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  child: Text(" ${widget._chapter.type} " +
                      " \u1d52 " +
                      " ${widget._chapter.date} " +
                      " \u1d52 " +
                      " ${widget._chapter.size} " +
                      "KB"),
                )
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
