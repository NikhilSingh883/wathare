import 'package:flutter/material.dart';
import 'package:wathare/models/chapter.dart';
import 'package:wathare/models/recent.dart';
import 'package:wathare/provider/chapters.dart';
import 'package:wathare/provider/recents.dart';
import 'package:wathare/size_config.dart';
import 'package:wathare/theme.dart';
import 'package:wathare/widgets/chapters_uploadedTile.dart';
import 'package:wathare/widgets/recentTile.dart';

import 'package:wathare/widgets/templateTile.dart';
import 'package:provider/provider.dart';

class ClassesScreen extends StatefulWidget {
  @override
  _ClassesScreenState createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Recent> _recents = [];
  List<Chapter> _chapters = [];
  @override
  void initState() {
    // TODO: implement initState
    _recents = Provider.of<Recents>(context, listen: false).getRecents;
    _chapters = Provider.of<Chapters>(context, listen: false).getChapters;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: SizeConfig.heightMultiplier * 8,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {},
            color: Colors.black,
          ),
          CircleAvatar(
            radius: SizeConfig.heightMultiplier * 4,
            backgroundImage: AssetImage('assets/teacher.jpg'),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.video_label),
            onPressed: () {},
            color: Colors.black,
          ),
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {},
            color: Colors.black,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        type: BottomNavigationBarType.fixed,
        iconSize: SizeConfig.heightMultiplier * 3,
        currentIndex: _selectedIndex,
        backgroundColor: Color(0xFFFFFBFA),
        selectedItemColor: Color(0xFF442B2D),
        unselectedItemColor: Color(0xFF442B2D).withOpacity(.60),
        selectedLabelStyle: AppTheme.selectedN,
        unselectedLabelStyle: AppTheme.unseletedN,
        onTap: (value) {
          // Respond to item press.
          setState(() => _selectedIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Notice',
            icon: Icon(Icons.add_alert_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Classes',
            icon: Icon(Icons.video_label_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Chat',
            icon: Icon(Icons.chat_bubble_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TemplateTile(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 3,
                    vertical: SizeConfig.heightMultiplier * 2),
                child: Row(
                  children: [
                    Text(
                      'Chapters Uploaded',
                      style: TextStyle(
                          color: Colors.deepPurple[800],
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                    ),
                    Spacer(),
                    Icon(Icons.add),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 5,
                    ),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
              Container(
                height: SizeConfig.heightMultiplier * 27,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _chapters.length,
                  itemBuilder: (context, index) {
                    return ChapterUploadedTile(_chapters[index]);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 3,
                    vertical: SizeConfig.heightMultiplier * 2),
                child: Row(
                  children: [
                    Text(
                      'Recents',
                      style: TextStyle(
                          color: Colors.deepPurple[800],
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                    ),
                    Spacer(),
                    Icon(Icons.add),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 5,
                    ),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
              Container(
                height: SizeConfig.heightMultiplier * 18,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _recents.length,
                  itemBuilder: (context, index) {
                    return RecentTile(_recents[index]);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 3,
                    vertical: SizeConfig.heightMultiplier * 2),
                child: Row(
                  children: [
                    Text(
                      'Assignments and Notes',
                      style: TextStyle(
                          color: Colors.deepPurple[800],
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                    ),
                    Spacer(),
                    Icon(Icons.add),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 5,
                    ),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
              Container(
                height: SizeConfig.heightMultiplier * 18,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _recents.length,
                  itemBuilder: (context, index) {
                    return RecentTile(_recents[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
