import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wathare/models/lecture.dart';
import 'package:wathare/size_config.dart';
import 'package:wathare/theme.dart';
import 'package:dots_indicator/dots_indicator.dart';

class TemplateTile extends StatefulWidget {
  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<TemplateTile> {
  List<Lecture> _lectures = [
    Lecture(
        currentTime: '15:10',
        startTime: '10:00',
        endTime: '10:45',
        standard: 5,
        subject: 'Geography',
        color: Colors.green[300]),
    Lecture(
      currentTime: '15:10',
      startTime: '10:00',
      endTime: '10:45',
      standard: 8,
      subject: 'History',
      color: Colors.red[300],
    ),
    Lecture(
      currentTime: '15:10',
      startTime: '10:00',
      endTime: '10:45',
      standard: 12,
      subject: 'English',
      color: Colors.purple[300],
    ),
  ];
  double _currentPosition = 0.0;
  double _validPosition(double position) {
    if (position >= _lectures.length) return 0;
    if (position < 0) return _lectures.length - 1.0;
    return position;
  }

  void _updatePosition(double position) {
    setState(() => _currentPosition = _validPosition(position));
  }

  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    const decorator = DotsDecorator(
      activeColor: Colors.white,
    );

    return Stack(children: [
      CarouselSlider(
        carouselController: _carouselController,
        options: CarouselOptions(
          onPageChanged: (idx, reason) {
            setState(() {
              _updatePosition(idx.toDouble());
            });
          },
          pageSnapping: false,
          height: SizeConfig.heightMultiplier * 25,
          initialPage: 0,
          autoPlay: true,
          viewportFraction: 1.0,
          autoPlayAnimationDuration: Duration(seconds: 2),
        ),
        items: _lectures.map((Lecture lecture) {
          return NewWidget(
            lecture: lecture,
          );
        }).toList(),
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: SizeConfig.heightMultiplier * 2,
        child: DotsIndicator(
          dotsCount: _lectures.length,
          position: _currentPosition,
          decorator: decorator,
          onTap: (pos) {
            _carouselController.jumpToPage(pos.toInt());
          },
        ),
      ),
    ]);
  }
}

class NewWidget extends StatefulWidget {
  final Lecture lecture;

  const NewWidget({
    @required this.lecture,
  });

  @override
  _NewWidgetState createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier,
          horizontal: SizeConfig.widthMultiplier),
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 5,
          vertical: SizeConfig.heightMultiplier * 0.5),
      // height: SizeConfig.heightMultiplier * 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: widget.lecture.color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 1.5),
              alignment: Alignment.topCenter,
              child: Text(
                "${widget.lecture.standard}" + '\u1d57' + '\u02b0',
                style: AppTheme.title,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: SizeConfig.heightMultiplier * 1.5),
                  child: FittedBox(
                    child: Text(
                      widget.lecture.subject + ' Class',
                      style: AppTheme.title,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.heightMultiplier * 1.5),
                  child: Text(
                    widget.lecture.startTime + ' - ' + widget.lecture.endTime,
                    style: AppTheme.title,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.heightMultiplier * 1),
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 8,
                    vertical: SizeConfig.widthMultiplier * 2.5,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.widthMultiplier * 1.5),
                      color: Colors.blueAccent),
                  child: Text(
                    'Join Link',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.heightMultiplier * 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier,
                vertical: SizeConfig.heightMultiplier * 0.5,
              ),
              height: SizeConfig.heightMultiplier * 3.5,
              margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 1.5),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConfig.widthMultiplier * 2),
                color: Colors.pinkAccent,
              ),
              alignment: Alignment.topCenter,
              child: Text(
                widget.lecture.currentTime,
                style: AppTheme.body2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
